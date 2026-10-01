import 'package:flutter/material.dart';

class Lesson03BaiTap01 extends StatefulWidget {
  const Lesson03BaiTap01({super.key});

  @override
  State<Lesson03BaiTap01> createState() => _Lesson03BaiTap01State();
}

class _Lesson03BaiTap01State extends State<Lesson03BaiTap01>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showDebugBorders = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onActionTap(String action) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Bạn đã nhấn nút: $action'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 03 - Bài 1: Vẽ Widget Tree'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.touch_app), text: 'Giao diện mẫu'),
            Tab(icon: Icon(Icons.account_tree), text: 'Sơ đồ Widget Tree'),
            Tab(icon: Icon(Icons.code), text: 'Mã nguồn & Giải thích'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildSampleUiTab(),
          _buildWidgetTreeTab(),
          _buildExplanationTab(),
        ],
      ),
    );
  }

  // ================= TAB 1: GIAO DIỆN MẪU (THEO MỤC 2.2) =================
  Widget _buildSampleUiTab() {
    final primaryColor = Theme.of(context).primaryColor;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Card đề bài
          Card(
            color: Colors.blue.shade50,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.blue.shade200),
            ),
            child: const Padding(
              padding: EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Đề bài: Bài tập 1 (Mục 2.2 - Conceptual example)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Hãy dựng giao diện và vẽ cây Widget (Widget tree) cho cụm 3 nút hành động: CALL, ROUTE, SHARE.',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Tuỳ chọn bật tắt viền debug layout
          SwitchListTile(
            title: const Text('Bật viền cấu trúc Layout (Debug Paint visual)'),
            subtitle: const Text('Quan sát trực quan viền của từng Container, Row, Column'),
            value: _showDebugBorders,
            onChanged: (value) {
              setState(() {
                _showDebugBorders = value;
              });
            },
          ),
          const SizedBox(height: 12),

          // Khung hiển thị giao diện chính thức
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
              child: Column(
                children: [
                  const Text(
                    'KẾT QUẢ HIỂN THỊ:',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // ĐÂY CHÍNH LÀ ĐOẠN WIDGET TREE GIAO DIỆN THEO ĐÚNG GIÁO TRÌNH
                  Container(
                    decoration: _showDebugBorders
                        ? BoxDecoration(
                            border: Border.all(color: Colors.red, width: 2),
                            color: Colors.red.withValues(alpha: 0.05),
                          )
                        : null,
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildButtonColumn(
                          primaryColor,
                          Icons.call,
                          'CALL',
                          _showDebugBorders,
                        ),
                        _buildButtonColumn(
                          primaryColor,
                          Icons.near_me,
                          'ROUTE',
                          _showDebugBorders,
                        ),
                        _buildButtonColumn(
                          primaryColor,
                          Icons.share,
                          'SHARE',
                          _showDebugBorders,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (_showDebugBorders) ...[
            const SizedBox(height: 16),
            Card(
              elevation: 0,
              color: Colors.grey.shade100,
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Chú giải viền:', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('🟥 Viền đỏ ngoài cùng: Container (Padding toàn hàng)'),
                    Text('🟧 Viền cam: Column (Xếp icon và text theo chiều dọc)'),
                    Text('🟩 Viền xanh lá: Icon (Visible widget)'),
                    Text('🟪 Viền tím: Container (Margin top cho Text)'),
                    Text('🟦 Viền xanh dương: Text (Visible widget)'),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // Hàm tạo từng cột nút bấm gồm: Column -> Icon + Container (Margin) -> Text
  Widget _buildButtonColumn(
    Color color,
    IconData icon,
    String label,
    bool showDebug,
  ) {
    final columnWidget = InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => _onActionTap(label),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            Container(
              decoration: showDebug
                  ? BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1.5),
                    )
                  : null,
              child: Icon(icon, color: color, size: 28),
            ),

            // Container bọc Text để tạo margin top
            Container(
              margin: const EdgeInsets.only(top: 8),
              decoration: showDebug
                  ? BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 1.5),
                    )
                  : null,
              child: Container(
                decoration: showDebug
                    ? BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 1),
                      )
                    : null,
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: color,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    if (showDebug) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, width: 1.5),
          color: Colors.orange.withValues(alpha: 0.05),
        ),
        child: columnWidget,
      );
    }
    return columnWidget;
  }

  // ================= TAB 2: VẼ WIDGET TREE TRỰC QUAN =================
  Widget _buildWidgetTreeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Chú thích loại widget
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTypeBadge(
                'Layout Widget',
                const Color(0xFFF8BBD0),
                const Color(0xFFC2185B),
                'Container, Row, Column (Định vị, căn lề)',
              ),
              const SizedBox(width: 16),
              _buildTypeBadge(
                'Visible Widget',
                const Color(0xFFBBDEFB),
                const Color(0xFF1976D2),
                'Icon, Text (Hiển thị nội dung trực tiếp)',
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Sơ đồ cây bằng Custom UI Cards
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                children: [
                  // Root: Container
                  _buildTreeNode(
                    title: 'Container',
                    sub: 'Padding: 16.0',
                    isLayout: true,
                    isRoot: true,
                  ),
                  _buildVerticalLine(),

                  // Row
                  _buildTreeNode(
                    title: 'Row',
                    sub: 'MainAxisAlignment: spaceEvenly',
                    isLayout: true,
                  ),
                  _buildVerticalLine(height: 16),

                  // Nhánh 3 cột
                  _buildBranchLine(),
                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Cột 1: CALL
                      Expanded(
                        child: _buildColumnBranch(
                          iconName: 'Icons.call',
                          labelName: "'CALL'",
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Cột 2: ROUTE
                      Expanded(
                        child: _buildColumnBranch(
                          iconName: 'Icons.near_me',
                          labelName: "'ROUTE'",
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Cột 3: SHARE
                      Expanded(
                        child: _buildColumnBranch(
                          iconName: 'Icons.share',
                          labelName: "'SHARE'",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Card tóm tắt cấu trúc phân cấp
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phân cấp cây Widget (Hierarchy View):',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Container (Root)\n'
                    ' └── Row\n'
                    '      ├── Column (Nút 1)\n'
                    '      │    ├── Icon (Icons.call)\n'
                    '      │    └── Container (margin: top 8)\n'
                    '      │         └── Text ("CALL")\n'
                    '      ├── Column (Nút 2)\n'
                    '      │    ├── Icon (Icons.near_me)\n'
                    '      │    └── Container (margin: top 8)\n'
                    '      │         └── Text ("ROUTE")\n'
                    '      └── Column (Nút 3)\n'
                    '           ├── Icon (Icons.share)\n'
                    '           └── Container (margin: top 8)\n'
                    '                └── Text ("SHARE")',
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 13,
                      height: 1.4,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeBadge(String label, Color bg, Color text, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: text.withValues(alpha: 0.5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(radius: 4, backgroundColor: text),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: text,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTreeNode({
    required String title,
    String? sub,
    required bool isLayout,
    bool isRoot = false,
  }) {
    final bgColor = isLayout ? const Color(0xFFFCE4EC) : const Color(0xFFE3F2FD);
    final borderColor = isLayout ? const Color(0xFFD81B60) : const Color(0xFF1E88E5);
    final textColor = isLayout ? const Color(0xFF880E4F) : const Color(0xFF0D47A1);

    return Container(
      width: 140,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: 1.5),
        boxShadow: isRoot
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                )
              ]
            : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: textColor,
            ),
          ),
          if (sub != null) ...[
            const SizedBox(height: 2),
            Text(
              sub,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: textColor.withValues(alpha: 0.8),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildVerticalLine({double height = 18}) {
    return Container(
      width: 2,
      height: height,
      color: Colors.grey.shade400,
    );
  }

  Widget _buildBranchLine() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: 320,
          child: Column(
            children: [
              Container(
                height: 2,
                color: Colors.grey.shade400,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildColumnBranch({
    required String iconName,
    required String labelName,
  }) {
    return Column(
      children: [
        _buildVerticalLine(height: 12),
        // Column node
        _buildTreeNode(title: 'Column', sub: 'mainAxisSize.min', isLayout: true),
        _buildVerticalLine(height: 12),

        // Nhánh Icon
        _buildTreeNode(title: 'Icon', sub: iconName, isLayout: false),
        _buildVerticalLine(height: 12),

        // Nhánh Container bọc Text
        _buildTreeNode(title: 'Container', sub: 'margin: top 8', isLayout: true),
        _buildVerticalLine(height: 12),

        // Text
        _buildTreeNode(title: 'Text', sub: labelName, isLayout: false),
      ],
    );
  }

  // ================= TAB 3: MÃ NGUỒN & GIẢI THÍCH CHI TIẾT =================
  Widget _buildExplanationTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Phân tích chi tiết từng Widget trong bài tập:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          _buildExplanationItem(
            '1. Container (Root ngoài cùng)',
            'Layout Widget: Bọc toàn bộ Row lại để tạo khoảng đệm (padding: 16.0) giữa cụm nút bấm và các thành phần khác trên màn hình.',
            Colors.pink.shade50,
            Colors.pink.shade700,
          ),
          _buildExplanationItem(
            '2. Row',
            'Layout Widget: Chứa 3 cột nút bấm và dàn đều theo chiều ngang với thuộc tính mainAxisAlignment: MainAxisAlignment.spaceEvenly.',
            Colors.pink.shade50,
            Colors.pink.shade700,
          ),
          _buildExplanationItem(
            '3. Column (3 nút)',
            'Layout Widget: Mỗi nút bấm là một cột xếp dọc gồm Icon ở trên và Text ở dưới. Đặt mainAxisSize: MainAxisSize.min để cột vừa khít nội dung.',
            Colors.pink.shade50,
            Colors.pink.shade700,
          ),
          _buildExplanationItem(
            '4. Icon (CALL, ROUTE, SHARE)',
            'Visible Widget: Hiển thị hình ảnh biểu tượng tương ứng với màu chủ đạo.',
            Colors.blue.shade50,
            Colors.blue.shade700,
          ),
          _buildExplanationItem(
            '5. Container (Margin cho Text)',
            'Layout Widget: Bọc riêng Text để tạo khoảng cách lề trên (margin: EdgeInsets.only(top: 8)) giúp chữ không bị dính sát vào icon phía trên.',
            Colors.pink.shade50,
            Colors.pink.shade700,
          ),
          _buildExplanationItem(
            '6. Text',
            'Visible Widget: Hiển thị nhãn chữ CALL, ROUTE, SHARE với kiểu chữ TextStyle in đậm và cùng màu với Icon.',
            Colors.blue.shade50,
            Colors.blue.shade700,
          ),

          const SizedBox(height: 16),
          const Text(
            'Mã nguồn Dart xây dựng cây Widget:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const SelectableText(
              '''// Đoạn mã tạo cụm nút bấm theo sơ đồ cây Widget
Widget buttonSection = Container(
  padding: const EdgeInsets.all(16.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(color, Icons.call, 'CALL'),
      _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
      _buildButtonColumn(color, Icons.share, 'SHARE'),
    ],
  ),
);

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}''',
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 12.5,
                color: Color(0xFF9CDCFE),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExplanationItem(
    String title,
    String desc,
    Color bg,
    Color accent,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: accent.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: accent,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            desc,
            style: const TextStyle(fontSize: 13, height: 1.3),
          ),
        ],
      ),
    );
  }
}
