/**
 * Created by T420 on 5/21/2018.
 */
var Dashboard = function () {
    var baseUrl = $('#site_meta').attr('data-baseurl')
    var tableStatistic = null;

    var Constants = {
        URL: {},
        ID: {
            TABLE_STATISTIC: '#table-statistic'
        }
    }
    var loadTableStatistics = function () {
        if (tableStatistic != null) {
            tableStatistic.ajax.reload();
        } else {
            tableStatistic = $(Constants.ID.TABLE_STATISTIC).DataTable({
                "dom": "<'row'<'col-sm-6'l><'col-sm-6'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-5'i><'col-sm-7'p>>",
                "processing": true,
                "serverSide": true,
                "oLanguage": {
                    "sLengthMenu": "Hiển thị _MENU_ bản ghi",
                    "sLoadingRecords": "Đang tải..",
                    "sSearch": "Tìm kiếm:",
                    "sZeroRecords": "Không có bản ghi nào",
                    "sInfoFiltered": " - lọc từ _MAX_ bản ghi",
                    "sInfo": "Hiển thị (_START_ - _END_) của tổng số _TOTAL_ bản ghi",
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
                        width: '10%',
                        searchable: false,
                        orderable: false
                    },
                    {
                        data: 'code',
                        width: '20%',
                    },
                    {
                        data: 'manager',
                        width: '20%',
                    },
                    {
                        data: 'surveyors_count',
                        width: '20%',
                    },
                    {
                        data: 'rendered',
                        width: '30%',
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
                        className: 'text-center',
                        render: function (data, type, row) {
                            if (row['rendered'] == 0) {
                                return '<a href="javascript:;" class="btn btn-primary btn-small render-url" data-id="' + row['id'] + '">Tạo URL</a>';
                            } else {
                                return '';
                            }

                        }
                    }
                ]
            });
            tableStatistic.on('order.dt search.dt draw.dt', function () {
                tableStatistic.column(0, {search: 'applied', order: 'applied'}).nodes().each(function (cell, i) {
                    cell.innerHTML = i + 1;
                });
            });
        }

    }

    var handleRenderUrl = function () {
        $(document).on('click', '.render-url', function () {
            var data = tableStatistic.row($(this).parents('tr')).data();
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
                    tableStatistic.ajax.reload();
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

    return {
        init: function () {
            loadTableStatistics();
        }
    }


}

$(document).ready(function () {
    Dashboard().init();
});