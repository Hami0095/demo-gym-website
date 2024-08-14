import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final VoidCallback onAboutUsTap;
  final VoidCallback onContactUsTap;
  final VoidCallback onProgramsTap;
  final VoidCallback onBecomeMemberTap;

  const Navbar({
    super.key,
    required this.onAboutUsTap,
    required this.onContactUsTap,
    required this.onProgramsTap,
    required this.onBecomeMemberTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('DENO GYM', style: TextStyle(color: Colors.yellow)),
      backgroundColor: Colors.black,
      actions: [
        _buildNavItem('About Us', onAboutUsTap),
        _buildNavItem('Contact Us', onContactUsTap),
        _buildNavItem('Our Programs', onProgramsTap),
        ElevatedButton(
          onPressed: onBecomeMemberTap,
          style: const ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll(Color.fromARGB(255, 106, 106, 106)),
            foregroundColor: WidgetStatePropertyAll(Colors.yellow),
          ),
          child: const Text('Become a Member'),
        ),
      ],
    );
  }

  Widget _buildNavItem(String text, VoidCallback onTap) {
    return NavItem(text: text, onTap: onTap);
  }
}

class NavItem extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const NavItem({super.key, required this.text, required this.onTap});

  @override
  // ignore: library_private_types_in_public_api
  _NavItemState createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _isHovered = false;

  void _onHover(PointerEvent event) {
    setState(() {
      _isHovered = true;
    });
  }

  void _onExit(PointerEvent event) {
    setState(() {
      _isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: _onHover,
      onExit: _onExit,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: widget.onTap,
            child: Text(
              widget.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 2,
            width: _isHovered ? 50 : 0,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class Navbar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: const Text('DENO GYM', style: TextStyle(color: Colors.yellow)),
//       backgroundColor: Colors.black,
//       actions: [
//         _buildNavItem('About Us'),
//         _buildNavItem('Contact Us'),
//         _buildNavItem('Our Programs'),
//         ElevatedButton(
//           onPressed: () {},
//           style: const ButtonStyle(
//             backgroundColor:
//                 MaterialStatePropertyAll(Color.fromARGB(255, 106, 106, 106)),
//             foregroundColor: MaterialStatePropertyAll(Colors.yellow),
//           ),
//           child: const Text('Become a Member'),
//         ),
//       ],
//     );
//   }

//   Widget _buildNavItem(String text) {
//     return NavItem(text: text);
//   }
// }

// class NavItem extends StatefulWidget {
//   final String text;

//   const NavItem({required this.text});

//   @override
//   _NavItemState createState() => _NavItemState();
// }

// class _NavItemState extends State<NavItem> {
//   bool _isHovered = false;

//   void _onHover(PointerEvent event) {
//     setState(() {
//       _isHovered = true;
//     });
//   }

//   void _onExit(PointerEvent event) {
//     setState(() {
//       _isHovered = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onHover: _onHover,
//       onExit: _onExit,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           TextButton(
//             onPressed: () {},
//             child: Text(
//               widget.text,
//               style: const TextStyle(color: Colors.white),
//             ),
//           ),
//           AnimatedContainer(
//             duration: const Duration(milliseconds: 300),
//             height: 2,
//             width: _isHovered ? 50 : 0,
//             color: Colors.yellow,
//           ),
//         ],
//       ),
//     );
//   }
// }





