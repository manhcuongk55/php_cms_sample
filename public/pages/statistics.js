/**
 * Created by T420 on 5/20/2018.
 */
var Statistics = function () {
    var baseUrl = $('#site_meta').attr('data-baseurl')
    var tableTopics = null;

    var Constants = {
        URL: {
            TOPIC_DATA: baseUrl + '/manager/topics/listing',
            RENDER_URL: baseUrl + '/manager/topics/url',
            EXPORT_TOPIC: baseUrl + '/manager/topics/export',
        },
        ID: {
            TABLE_TOPIC: '#table-topics',
            NUMBER_URL: '#number-url'
        }
    }
    var loadTableTopics = function () {
        if (tableTopics != null) {
            tableTopics.ajax.reload();
        } else {
            tableTopics = $(Constants.ID.TABLE_TOPIC).DataTable({
                "dom": "<'row'<'col-sm-6'l><'col-sm-6'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-5'i><'col-sm-7'p>>",
                "processing": true,
                "serverSide": true,
                "oLanguage": {
                    "sLengthMenu": "Hiển thị _MENU_ bản ghi",
                    "sLoadingRecords": "Đang tải..",
                    "sSearch": "Tìm kiếm:",
                    "sZeroRecords": "Không có bản ghi nào",
                    "sInfoFiltered": "",
                    "sInfo": "Hiển thị (_START_ - _END_) của tổng số _TOTAL_",
                    "oPaginate": {
                        "sFirst": "Trang đầu",
                        "sPrevious": "Trước",
                        "sNext": "Sau",
                        "sLast": "Trang cuối"
                    }
                },
                "ajax": {
                    "url": Constants.URL.TOPIC_DATA,
                    "type": "POST"
                },
                "order": [[1, 'asc']],
                "columns": [
                    {
                        data: null,
                        searchable: false,
                        orderable: false
                    },
                    {
                        data: 'code',
                    },
                    {
                        data: 'manager',
                    },
                    {
                        data: 'surveyors_count',
                        sortable: false,
                    },
                    {
                        data: 'new',
                        sortable: false,
                    },
                    {
                        data: 'seen',
                        sortable: false,
                    },
                    {
                        data: 'done',
                        sortable: false,
                    },
                    {
                        data: 'rendered',
                        className: 'text-right',
                        sortable: false,
                        render: function (data, type, row) {
                            if (data == 1) {
                                return 'Đã khảo sát';
                            } else {
                                return 'Chưa khảo sát';
                            }
                        }
                    },
                    {
                        data: null,
                        sortable: false,
                        className: 'text-center action-group',
                        render: function (data, type, row) {
                            if (row['rendered'] == 0) {
                                return '<a href="javascript:;" class="render-url" data-id="' + row['id'] + '">Tạo URL</a>';
                            } else {
                                // return '<a href="javascript:;" class="btn btn-success btn-small detail-topic" data-id="' + row['id'] + '">Chi tiết</a>'
                                return '<a href="javascript:;" class="export-topic" data-id="' + row['id'] + '">Xuất báo cáo</a>';
                            }
                        }
                    }
                ]
            });
            tableTopics.on('order.dt search.dt draw.dt', function () {
                tableTopics.column(0, {search: 'applied', order: 'applied'}).nodes().each(function (cell, i) {
                    cell.innerHTML = 1 + i + (parseInt(this.page.info().page) * parseInt(this.page.info().length));
                });
            });
        }

    }

    var handleRenderUrl = function () {
        $(document).on('click', '.render-url', function () {
            var data = tableTopics.row($(this).parents('tr')).data();
            if (data.rendered == 1) {
                toastr.error('Chủ đề này đã được thống kê', 'Thông báo');
                return;
            }
            var dialog = bootbox.dialog({
                title: 'Tạo URL',
                message: 'Số lượng URL: <input class="form-control" id="number-url">',
                inputType: 'text',
                buttons: {
                    cancel: {
                        label: "Hủy bỏ",
                        className: 'btn-default',
                        callback: function () {

                        }
                    },
                    ok: {
                        label: "Tạo",
                        className: 'btn-primary',
                        callback: function () {
                            var number = parseInt($(Constants.ID.NUMBER_URL).val());
                            if ($(Constants.ID.NUMBER_URL).val().trim() == '' ||
                                isNaN($(Constants.ID.NUMBER_URL).val()) || number == 0) {
                                toastr.error('Số lượng URL không hợp lệ');
                                return;
                            } else {
                                renderUrl(data.id, number);
                            }
                        }
                    }
                }
            });
        })
    }

    var renderUrl = function (id, number) {
        var dialog = bootbox.dialog({
            message: '<p class="text-center">Đang tải...</p>',
            closeButton: false
        });

        $.ajax({
            'url': Constants.URL.RENDER_URL,
            'type': 'POST',
            'data': {
                'id': id,
                'number': number
            },
            'success': function (data) {
                dialog.modal('hide');
                if (data != null && data.code == 1) {
                    toastr.success('Tạo URL thành công', 'Thông báo');
                    tableTopics.ajax.reload();
                } else {
                    toastr.error('Có lỗi xảy ra. Vui lòng thử lại sau', 'Thông báo');
                }
            },
            'error': function (err, msg) {
                dialog.modal('hide');
                toastr.error('Có lỗi xảy ra. Vui lòng thử lại sau', 'Thông báo');
            }

        })
    }

    var handleExportTopic = function () {
        $(document).on('click', '.export-topic', function () {
            var data = tableTopics.row($(this).parents('tr')).data();
            if (data.rendered == 0) {
                toastr.error('Chủ đề này chưa được khảo sát ', 'Thông báo');
                return;
            }
            // var dialog = bootbox.dialog({
            //     message: '<p class="text-center">Đang xử lý...</p>',
            //     closeButton: false
            // });

            $.fileDownload(Constants.URL.EXPORT_TOPIC, {
                httpMethod: "GET",
                data: {
                    id: data.id
                },
                successCallback: function (url) {
                    dialog.modal('hide');
                },
                failCallback: function (responseHtml, url) {
                    toastr.error('Có lỗi xảy ra. Vui lòng thử lại sau', 'Thông báo');
                    dialog.modal('hide');
                }
            });

        })
    }


    return {
        init: function () {
            loadTableTopics();
            handleRenderUrl();
            handleExportTopic();
        }
    }


}

$(document).ready(function () {
    Statistics().init();
});