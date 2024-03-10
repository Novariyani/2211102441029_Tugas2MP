import 'dart:convert';

class Block {
  final String type;
  final String text;
  Block(this.type, this.text);

  factory Block.fromJson(Map<String, dynamic> json) {
    return Block(json['type'], json['text']);
  }
}

class Document {
  final Map<String, dynamic> _json;
  Document() : _json = jsonDecode(documentJson);

  Map<String, dynamic> getMetadata() {
    if (_json.containsKey('metadata')) {
      final metadata = _json['metadata'];
      if (metadata is Map<String, dynamic> &&
          metadata.containsKey('title') &&
          metadata.containsKey('modified')) {
        final title = metadata['title'];
        final modified = DateTime.parse(metadata['modified']);
        return {'title': title, 'modified': modified};
      }
    }
    throw const FormatException('Unexpected JSON');
  }

  List<Block> getBlocks() {
    final List<dynamic> jsonBlocks = _json['blocks'];
    return jsonBlocks.map((jsonBlock) => Block.fromJson(jsonBlock)).toList();
  }
}



const documentJson = '''
{
  "metadata": {
    "title": "My Document",
    "modified": "2023-05-10"
  },
  "blocks": [
    {
      "type": "h1",
      "text": "Chapter 1"
    },
    {
      "type": "p",
      "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    },
    {
      "type": "checkbox",
      "checked": false,
      "text": "Learn Dart 3"
    }
  ]
}
''';

void main() {
  final document = Document();
  final metadata = document.getMetadata();
  final blocks = document.getBlocks();

  print('Metadata:');
  print('Title: ${metadata['title']}');
  print('Modified: ${metadata['modified']}');

  print('\nBlocks:');
  for (var block in blocks) {
    print('Type: ${block.type}, Text: ${block.text}');
  }
}
