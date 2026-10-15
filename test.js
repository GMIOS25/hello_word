import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
  stages: [
    { duration: '1s', target: 10000 }
  ],
  thresholds: {
    http_req_failed: ['rate<0.05'], // Cho phép tỷ lệ lỗi tối đa 5%
  },
};

export default function () {
  const res = http.get('http://yangkleeserver.ddns.net:8080/');
  check(res, {
    'status is 200': (r) => r.status === 200,
  });
}