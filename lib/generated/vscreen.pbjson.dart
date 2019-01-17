///
//  Generated code. Do not modify.
//  source: vscreen.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

const StatusCode$json = const {
  '1': 'StatusCode',
  '2': const [
    const {'1': 'OK', '2': 0},
  ],
};

const Empty$json = const {
  '1': 'Empty',
};

const Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.StatusCode', '10': 'code'},
  ],
};

const Credential$json = const {
  '1': 'Credential',
  '2': const [
    const {'1': 'password', '3': 1, '4': 1, '5': 9, '10': 'password'},
  ],
};

const Source$json = const {
  '1': 'Source',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
  ],
};

const Position$json = const {
  '1': 'Position',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 2, '10': 'value'},
  ],
};

const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

const Info$json = const {
  '1': 'Info',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'thumbnailURL', '3': 2, '4': 1, '5': 9, '10': 'thumbnailURL'},
    const {'1': 'volume', '3': 3, '4': 1, '5': 1, '10': 'volume'},
    const {'1': 'position', '3': 4, '4': 1, '5': 1, '10': 'position'},
    const {'1': 'state', '3': 5, '4': 1, '5': 14, '6': '.Info.State', '10': 'state'},
  ],
  '4': const [Info_State$json],
};

const Info_State$json = const {
  '1': 'State',
  '2': const [
    const {'1': 'PLAYING', '2': 0},
    const {'1': 'PAUSED', '2': 1},
    const {'1': 'STOPPED', '2': 2},
  ],
};

