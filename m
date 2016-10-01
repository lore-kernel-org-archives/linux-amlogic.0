From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 1 Oct 2016 17:58:54 +0200
Subject: stmmac/RTL8211F/Meson GXBB: TX throughput problems
In-Reply-To: <d59f6e2c-15ff-779d-da2f-8eb5f5a535a6@st.com>
References: <CAFBinCALSL_-izJ2tEsAjevAw90kGNTrQ3na3D1YV8f1dS1=Xg@mail.gmail.com>
 <ff6f3501-fbd5-3e79-dcc1-549406a5144b@st.com>
 <CAFBinCD42A_SqQz8GM-H+A32dMELknAytHuJ5T2YgZ3BrMKA3A@mail.gmail.com>
 <20160917232312.1e30d425@gmail.com>
 <d59f6e2c-15ff-779d-da2f-8eb5f5a535a6@st.com>
Message-ID: <CAFBinCD_-KjVa70iOhBSGaXZc9uKy2m4d2yVr-AfLiV7F=3EqQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hello Peppe,

On Mon, Sep 26, 2016 at 8:17 AM, Giuseppe CAVALLARO
<peppe.cavallaro@st.com> wrote:
> Hello Andr?
>
> On 9/17/2016 11:23 PM, Andr? Roth wrote:
>>
>>
>> Hi all,
>>
>> I have an odroid c2 board which shows this issue. No data is
>> transmitted or received after a moment of intense tx traffic. Copying a
>> 1GB file per scp from the board triggers it repeatedly.
>>
>> The board has a stmmac - user ID: 0x11, Synopsys ID: 0x37.
>>
>> When switching the network to 100Mb/s the copying does
>> not seam to trigger the issue.
>>
>> I've attached the ethtool statistics before and after the problem.
>
>
> at first glance, it enters in EEE mode often in the ethtool.after.
> On some platforms we met problems and it was necessary to disable the
> feature. Maybe, you can start looking at if this is true on yours.
> We will see to provide a clean subset of patches to switch-on/off it.
I did some hacking in the stmmac driver to disable the LPI stuff (see
the attachment)

Unfortunately this did not fix the problem.

I did not issue any ethtool commands not shown in the logs.
Also I did not have time to change the AXI tuning / PBL value yet - so
those are also untouched.

I will keep testing, but unfortunately my device is starting to fall
apart (I sometimes have DDR initialization issues and u-boot fails to
come up, oh dear...).
-------------- next part --------------
# ethtool -S eth0   
NIC statistics:
     mmc_tx_octetcount_gb: 0
     mmc_tx_framecount_gb: 0
     mmc_tx_broadcastframe_g: 0
     mmc_tx_multicastframe_g: 0
     mmc_tx_64_octets_gb: 0
     mmc_tx_65_to_127_octets_gb: 0
     mmc_tx_128_to_255_octets_gb: 0
     mmc_tx_256_to_511_octets_gb: 0
     mmc_tx_512_to_1023_octets_gb: 0
     mmc_tx_1024_to_max_octets_gb: 0
     mmc_tx_unicast_gb: 0
     mmc_tx_multicast_gb: 0
     mmc_tx_broadcast_gb: 0
     mmc_tx_underflow_error: 0
     mmc_tx_singlecol_g: 0
     mmc_tx_multicol_g: 0
     mmc_tx_deferred: 0
     mmc_tx_latecol: 0
     mmc_tx_exesscol: 0
     mmc_tx_carrier_error: 0
     mmc_tx_octetcount_g: 0
     mmc_tx_framecount_g: 0
     mmc_tx_excessdef: 0
     mmc_tx_pause_frame: 0
     mmc_tx_vlan_frame_g: 0
     mmc_rx_framecount_gb: 94
     mmc_rx_octetcount_gb: 89097
     mmc_rx_octetcount_g: 89097
     mmc_rx_broadcastframe_g: 29
     mmc_rx_multicastframe_g: 1
     mmc_rx_crc_error: 0
     mmc_rx_align_error: 0
     mmc_rx_run_error: 0
     mmc_rx_jabber_error: 0
     mmc_rx_undersize_g: 0
     mmc_rx_oversize_g: 0
     mmc_rx_64_octets_gb: 29
     mmc_rx_65_to_127_octets_gb: 4
     mmc_rx_128_to_255_octets_gb: 0
     mmc_rx_256_to_511_octets_gb: 4
     mmc_rx_512_to_1023_octets_gb: 1
     mmc_rx_1024_to_max_octets_gb: 56
     mmc_rx_unicast_g: 64
     mmc_rx_length_error: 0
     mmc_rx_autofrangetype: 0
     mmc_rx_pause_frames: 0
     mmc_rx_fifo_overflow: 0
     mmc_rx_vlan_frames_gb: 0
     mmc_rx_watchdog_error: 0
     mmc_rx_ipc_intr_mask: 1073692671
     mmc_rx_ipc_intr: 0
     mmc_rx_ipv4_gd: 65
     mmc_rx_ipv4_hderr: 0
     mmc_rx_ipv4_nopay: 1
     mmc_rx_ipv4_frag: 0
     mmc_rx_ipv4_udsbl: 0
     mmc_rx_ipv4_gd_octets: 86071
     mmc_rx_ipv4_hderr_octets: 0
     mmc_rx_ipv4_nopay_octets: 46
     mmc_rx_ipv4_frag_octets: 0
     mmc_rx_ipv4_udsbl_octets: 0
     mmc_rx_ipv6_gd_octets: 0
     mmc_rx_ipv6_hderr_octets: 0
     mmc_rx_ipv6_nopay_octets: 0
     mmc_rx_ipv6_gd: 0
     mmc_rx_ipv6_hderr: 0
     mmc_rx_ipv6_nopay: 0
     mmc_rx_udp_gd: 4
     mmc_rx_udp_err: 0
     mmc_rx_tcp_gd: 61
     mmc_rx_tcp_err: 0
     mmc_rx_icmp_gd: 0
     mmc_rx_icmp_err: 0
     mmc_rx_udp_gd_octets: 997
     mmc_rx_udp_err_octets: 0
     mmc_rx_tcp_gd_octets: 83774
     mmc_rx_tcp_err_octets: 0
     mmc_rx_icmp_gd_octets: 0
     mmc_rx_icmp_err_octets: 0
     tx_underflow: 0
     tx_carrier: 0
     tx_losscarrier: 0
     vlan_tag: 0
     tx_deferred: 0
     tx_vlan: 0
     tx_jabber: 0
     tx_frame_flushed: 0
     tx_payload_error: 0
     tx_ip_header_error: 0
     rx_desc: 0
     sa_filter_fail: 0
     overflow_error: 0
     ipc_csum_error: 0
     rx_collision: 0
     rx_crc: 0
     dribbling_bit: 0
     rx_length: 0
     rx_mii: 0
     rx_multicast: 0
     rx_gmac_overflow: 0
     rx_watchdog: 0
     da_rx_filter_fail: 0
     sa_rx_filter_fail: 0
     rx_missed_cntr: 0
     rx_overflow_cntr: 0
     rx_vlan: 0
     tx_undeflow_irq: 0
     tx_process_stopped_irq: 0
     tx_jabber_irq: 0
     rx_overflow_irq: 0
     rx_buf_unav_irq: 0
     rx_process_stopped_irq: 0
     rx_watchdog_irq: 0
     tx_early_irq: 0
     fatal_bus_error_irq: 0
     rx_early_irq: 0
     threshold: 1
     tx_pkt_n: 30
     rx_pkt_n: 94
     normal_irq_n: 36
     rx_normal_irq_n: 36
     napi_poll: 36
     tx_normal_irq_n: 0
     tx_clean: 46
     tx_set_ic_bit: 0
     irq_receive_pmt_irq_n: 0
     mmc_tx_irq_n: 0
     mmc_rx_irq_n: 0
     mmc_rx_csum_offload_irq_n: 0
     irq_tx_path_in_lpi_mode_n: 0
     irq_tx_path_exit_lpi_mode_n: 0
     irq_rx_path_in_lpi_mode_n: 0
     irq_rx_path_exit_lpi_mode_n: 0
     phy_eee_wakeup_error_n: 0
     ip_hdr_err: 0
     ip_payload_err: 0
     ip_csum_bypassed: 0
     ipv4_pkt_rcvd: 0
     ipv6_pkt_rcvd: 0
     rx_msg_type_ext_no_ptp: 0
     rx_msg_type_sync: 0
     rx_msg_type_follow_up: 0
     rx_msg_type_delay_req: 0
     rx_msg_type_delay_resp: 0
     rx_msg_type_pdelay_req: 0
     rx_msg_type_pdelay_resp: 0
     rx_msg_type_pdelay_follow_up: 0
     ptp_frame_type: 0
     ptp_ver: 0
     timestamp_dropped: 0
     av_pkt_rcvd: 0
     av_tagged_pkt_rcvd: 0
     vlan_tag_priority_val: 0
     l3_filter_match: 0
     l4_filter_match: 0
     l3_l4_filter_no_match: 0
     irq_pcs_ane_n: 0
     irq_pcs_link_n: 0
     irq_rgmii_n: 1
     mtl_tx_status_fifo_full: 0
     mtl_tx_fifo_not_empty: 0
     mmtl_fifo_ctrl: 0
     mtl_tx_fifo_read_ctrl_write: 0
     mtl_tx_fifo_read_ctrl_wait: 0
     mtl_tx_fifo_read_ctrl_read: 0
     mtl_tx_fifo_read_ctrl_idle: 0
     mac_tx_in_pause: 0
     mac_tx_frame_ctrl_xfer: 0
     mac_tx_frame_ctrl_idle: 0
     mac_tx_frame_ctrl_wait: 0
     mac_tx_frame_ctrl_pause: 0
     mac_gmii_tx_proto_engine: 0
     mtl_rx_fifo_fill_level_full: 0
     mtl_rx_fifo_fill_above_thresh: 0
     mtl_rx_fifo_fill_below_thresh: 0
     mtl_rx_fifo_fill_level_empty: 0
     mtl_rx_fifo_read_ctrl_flush: 0
     mtl_rx_fifo_read_ctrl_read_data: 0
     mtl_rx_fifo_read_ctrl_status: 0
     mtl_rx_fifo_read_ctrl_idle: 0
     mtl_rx_fifo_ctrl_active: 0
     mac_rx_frame_ctrl_fifo: 0
     mac_gmii_rx_proto_engine: 0
     tx_tso_frames: 0
     tx_tso_nfrags: 0
# iperf3 --client 192.168.1.100             
Connecting to host 192.168.1.100, port 5201
[  4] local 192.168.1.248 port 36472 connected to 192.168.1.100 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-1.00   sec   100 KBytes   822 Kbits/sec   10   1.41 KBytes       
[  4]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes       
[  4]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes       
[  4]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes       
[  4]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes       
[  4]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes       
[  4]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes       
[  4]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes       
[  4]   8.00-9.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes       
[  4]   9.00-10.00  sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes       
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec   100 KBytes  82.2 Kbits/sec   13             sender
[  4]   0.00-10.00  sec  2.83 KBytes  2.32 Kbits/sec                  receiver

iperf Done.
# ethtool -S eth0              
NIC statistics:
     mmc_tx_octetcount_gb: 0
     mmc_tx_framecount_gb: 0
     mmc_tx_broadcastframe_g: 0
     mmc_tx_multicastframe_g: 0
     mmc_tx_64_octets_gb: 0
     mmc_tx_65_to_127_octets_gb: 0
     mmc_tx_128_to_255_octets_gb: 0
     mmc_tx_256_to_511_octets_gb: 0
     mmc_tx_512_to_1023_octets_gb: 0
     mmc_tx_1024_to_max_octets_gb: 0
     mmc_tx_unicast_gb: 0
     mmc_tx_multicast_gb: 0
     mmc_tx_broadcast_gb: 0
     mmc_tx_underflow_error: 0
     mmc_tx_singlecol_g: 0
     mmc_tx_multicol_g: 0
     mmc_tx_deferred: 0
     mmc_tx_latecol: 0
     mmc_tx_exesscol: 0
     mmc_tx_carrier_error: 0
     mmc_tx_octetcount_g: 0
     mmc_tx_framecount_g: 0
     mmc_tx_excessdef: 0
     mmc_tx_pause_frame: 0
     mmc_tx_vlan_frame_g: 0
     mmc_rx_framecount_gb: 120
     mmc_rx_octetcount_gb: 91176
     mmc_rx_octetcount_g: 91176
     mmc_rx_broadcastframe_g: 32
     mmc_rx_multicastframe_g: 1
     mmc_rx_crc_error: 0
     mmc_rx_align_error: 0
     mmc_rx_run_error: 0
     mmc_rx_jabber_error: 0
     mmc_rx_undersize_g: 0
     mmc_rx_oversize_g: 0
     mmc_rx_64_octets_gb: 33
     mmc_rx_65_to_127_octets_gb: 25
     mmc_rx_128_to_255_octets_gb: 0
     mmc_rx_256_to_511_octets_gb: 5
     mmc_rx_512_to_1023_octets_gb: 1
     mmc_rx_1024_to_max_octets_gb: 56
     mmc_rx_unicast_g: 87
     mmc_rx_length_error: 0
     mmc_rx_autofrangetype: 0
     mmc_rx_pause_frames: 0
     mmc_rx_fifo_overflow: 0
     mmc_rx_vlan_frames_gb: 0
     mmc_rx_watchdog_error: 0
     mmc_rx_ipc_intr_mask: 2147385342
     mmc_rx_ipc_intr: 0
     mmc_rx_ipv4_gd: 87
     mmc_rx_ipv4_hderr: 0
     mmc_rx_ipv4_nopay: 1
     mmc_rx_ipv4_frag: 0
     mmc_rx_ipv4_udsbl: 0
     mmc_rx_ipv4_gd_octets: 87498
     mmc_rx_ipv4_hderr_octets: 0
     mmc_rx_ipv4_nopay_octets: 46
     mmc_rx_ipv4_frag_octets: 0
     mmc_rx_ipv4_udsbl_octets: 0
     mmc_rx_ipv6_gd_octets: 0
     mmc_rx_ipv6_hderr_octets: 0
     mmc_rx_ipv6_nopay_octets: 0
     mmc_rx_ipv6_gd: 0
     mmc_rx_ipv6_hderr: 0
     mmc_rx_ipv6_nopay: 0
     mmc_rx_udp_gd: 4
     mmc_rx_udp_err: 0
     mmc_rx_tcp_gd: 83
     mmc_rx_tcp_err: 0
     mmc_rx_icmp_gd: 0
     mmc_rx_icmp_err: 0
     mmc_rx_udp_gd_octets: 997
     mmc_rx_udp_err_octets: 0
     mmc_rx_tcp_gd_octets: 84761
     mmc_rx_tcp_err_octets: 0
     mmc_rx_icmp_gd_octets: 0
     mmc_rx_icmp_err_octets: 0
     tx_underflow: 0
     tx_carrier: 0
     tx_losscarrier: 0
     vlan_tag: 0
     tx_deferred: 0
     tx_vlan: 0
     tx_jabber: 0
     tx_frame_flushed: 0
     tx_payload_error: 0
     tx_ip_header_error: 0
     rx_desc: 0
     sa_filter_fail: 0
     overflow_error: 0
     ipc_csum_error: 0
     rx_collision: 0
     rx_crc: 0
     dribbling_bit: 0
     rx_length: 0
     rx_mii: 0
     rx_multicast: 0
     rx_gmac_overflow: 0
     rx_watchdog: 0
     da_rx_filter_fail: 0
     sa_rx_filter_fail: 0
     rx_missed_cntr: 0
     rx_overflow_cntr: 0
     rx_vlan: 0
     tx_undeflow_irq: 0
     tx_process_stopped_irq: 0
     tx_jabber_irq: 0
     rx_overflow_irq: 0
     rx_buf_unav_irq: 0
     rx_process_stopped_irq: 0
     rx_watchdog_irq: 0
     tx_early_irq: 0
     fatal_bus_error_irq: 0
     rx_early_irq: 0
     threshold: 1
     tx_pkt_n: 80
     rx_pkt_n: 120
     normal_irq_n: 56
     rx_normal_irq_n: 55
     napi_poll: 56
     tx_normal_irq_n: 1
     tx_clean: 79
     tx_set_ic_bit: 1
     irq_receive_pmt_irq_n: 0
     mmc_tx_irq_n: 0
     mmc_rx_irq_n: 0
     mmc_rx_csum_offload_irq_n: 0
     irq_tx_path_in_lpi_mode_n: 0
     irq_tx_path_exit_lpi_mode_n: 0
     irq_rx_path_in_lpi_mode_n: 0
     irq_rx_path_exit_lpi_mode_n: 0
     phy_eee_wakeup_error_n: 0
     ip_hdr_err: 0
     ip_payload_err: 0
     ip_csum_bypassed: 0
     ipv4_pkt_rcvd: 0
     ipv6_pkt_rcvd: 0
     rx_msg_type_ext_no_ptp: 0
     rx_msg_type_sync: 0
     rx_msg_type_follow_up: 0
     rx_msg_type_delay_req: 0
     rx_msg_type_delay_resp: 0
     rx_msg_type_pdelay_req: 0
     rx_msg_type_pdelay_resp: 0
     rx_msg_type_pdelay_follow_up: 0
     ptp_frame_type: 0
     ptp_ver: 0
     timestamp_dropped: 0
     av_pkt_rcvd: 0
     av_tagged_pkt_rcvd: 0
     vlan_tag_priority_val: 0
     l3_filter_match: 0
     l4_filter_match: 0
     l3_l4_filter_no_match: 0
     irq_pcs_ane_n: 0
     irq_pcs_link_n: 0
     irq_rgmii_n: 1
     mtl_tx_status_fifo_full: 0
     mtl_tx_fifo_not_empty: 0
     mmtl_fifo_ctrl: 0
     mtl_tx_fifo_read_ctrl_write: 0
     mtl_tx_fifo_read_ctrl_wait: 0
     mtl_tx_fifo_read_ctrl_read: 0
     mtl_tx_fifo_read_ctrl_idle: 0
     mac_tx_in_pause: 0
     mac_tx_frame_ctrl_xfer: 0
     mac_tx_frame_ctrl_idle: 0
     mac_tx_frame_ctrl_wait: 0
     mac_tx_frame_ctrl_pause: 0
     mac_gmii_tx_proto_engine: 0
     mtl_rx_fifo_fill_level_full: 0
     mtl_rx_fifo_fill_above_thresh: 0
     mtl_rx_fifo_fill_below_thresh: 0
     mtl_rx_fifo_fill_level_empty: 0
     mtl_rx_fifo_read_ctrl_flush: 0
     mtl_rx_fifo_read_ctrl_read_data: 0
     mtl_rx_fifo_read_ctrl_status: 0
     mtl_rx_fifo_read_ctrl_idle: 0
     mtl_rx_fifo_ctrl_active: 0
     mac_rx_frame_ctrl_fifo: 0
     mac_gmii_rx_proto_engine: 0
     tx_tso_frames: 0
     tx_tso_nfrags: 0
# iperf3 --client 192.168.1.100 -R
Connecting to host 192.168.1.100, port 5201
Reverse mode, remote host 192.168.1.100 is sending
[  4] local 192.168.1.248 port 36476 connected to 192.168.1.100 port 5201
[ ID] Interval           Transfer     Bandwidth
[  4]   0.00-1.00   sec   111 MBytes   929 Mbits/sec                  
[  4]   1.00-2.00   sec   111 MBytes   934 Mbits/sec                  
[  4]   2.00-3.00   sec   111 MBytes   934 Mbits/sec                  
[  4]   3.00-4.00   sec   111 MBytes   934 Mbits/sec                  
[  4]   4.00-5.00   sec   111 MBytes   935 Mbits/sec                  
[  4]   5.00-6.00   sec   111 MBytes   934 Mbits/sec                  
[  4]   6.00-7.00   sec   111 MBytes   934 Mbits/sec                  
[  4]   7.00-8.00   sec   111 MBytes   934 Mbits/sec                  
[  4]   8.00-9.00   sec   111 MBytes   934 Mbits/sec                  
[  4]   9.00-10.00  sec   111 MBytes   934 Mbits/sec                  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec  1.09 GBytes   936 Mbits/sec    0             sender
[  4]   0.00-10.00  sec  1.09 GBytes   934 Mbits/sec                  receiver

iperf Done.
# ethtool -S eth0                 
NIC statistics:
     mmc_tx_octetcount_gb: 0
     mmc_tx_framecount_gb: 0
     mmc_tx_broadcastframe_g: 0
     mmc_tx_multicastframe_g: 0
     mmc_tx_64_octets_gb: 0
     mmc_tx_65_to_127_octets_gb: 0
     mmc_tx_128_to_255_octets_gb: 0
     mmc_tx_256_to_511_octets_gb: 0
     mmc_tx_512_to_1023_octets_gb: 0
     mmc_tx_1024_to_max_octets_gb: 0
     mmc_tx_unicast_gb: 0
     mmc_tx_multicast_gb: 0
     mmc_tx_broadcast_gb: 0
     mmc_tx_underflow_error: 0
     mmc_tx_singlecol_g: 0
     mmc_tx_multicol_g: 0
     mmc_tx_deferred: 0
     mmc_tx_latecol: 0
     mmc_tx_exesscol: 0
     mmc_tx_carrier_error: 0
     mmc_tx_octetcount_g: 0
     mmc_tx_framecount_g: 0
     mmc_tx_excessdef: 0
     mmc_tx_pause_frame: 0
     mmc_tx_vlan_frame_g: 0
     mmc_rx_framecount_gb: 807320
     mmc_rx_octetcount_gb: 1225389106
     mmc_rx_octetcount_g: 1225389106
     mmc_rx_broadcastframe_g: 38
     mmc_rx_multicastframe_g: 1
     mmc_rx_crc_error: 0
     mmc_rx_align_error: 0
     mmc_rx_run_error: 0
     mmc_rx_jabber_error: 0
     mmc_rx_undersize_g: 0
     mmc_rx_oversize_g: 0
     mmc_rx_64_octets_gb: 39
     mmc_rx_65_to_127_octets_gb: 40
     mmc_rx_128_to_255_octets_gb: 0
     mmc_rx_256_to_511_octets_gb: 6
     mmc_rx_512_to_1023_octets_gb: 1
     mmc_rx_1024_to_max_octets_gb: 807234
     mmc_rx_unicast_g: 807281
     mmc_rx_length_error: 0
     mmc_rx_autofrangetype: 0
     mmc_rx_pause_frames: 0
     mmc_rx_fifo_overflow: 0
     mmc_rx_vlan_frames_gb: 0
     mmc_rx_watchdog_error: 0
     mmc_rx_ipc_intr_mask: 3221078013
     mmc_rx_ipc_intr: 0
     mmc_rx_ipv4_gd: 807281
     mmc_rx_ipv4_hderr: 0
     mmc_rx_ipv4_nopay: 1
     mmc_rx_ipv4_frag: 0
     mmc_rx_ipv4_udsbl: 0
     mmc_rx_ipv4_gd_octets: 1210855552
     mmc_rx_ipv4_hderr_octets: 0
     mmc_rx_ipv4_nopay_octets: 46
     mmc_rx_ipv4_frag_octets: 0
     mmc_rx_ipv4_udsbl_octets: 0
     mmc_rx_ipv6_gd_octets: 0
     mmc_rx_ipv6_hderr_octets: 0
     mmc_rx_ipv6_nopay_octets: 0
     mmc_rx_ipv6_gd: 0
     mmc_rx_ipv6_hderr: 0
     mmc_rx_ipv6_nopay: 0
     mmc_rx_udp_gd: 4
     mmc_rx_udp_err: 0
     mmc_rx_tcp_gd: 807277
     mmc_rx_tcp_err: 0
     mmc_rx_icmp_gd: 0
     mmc_rx_icmp_err: 0
     mmc_rx_udp_gd_octets: 997
     mmc_rx_udp_err_octets: 0
     mmc_rx_tcp_gd_octets: 1194708935
     mmc_rx_tcp_err_octets: 0
     mmc_rx_icmp_gd_octets: 0
     mmc_rx_icmp_err_octets: 0
     tx_underflow: 0
     tx_carrier: 0
     tx_losscarrier: 0
     vlan_tag: 0
     tx_deferred: 0
     tx_vlan: 0
     tx_jabber: 0
     tx_frame_flushed: 0
     tx_payload_error: 0
     tx_ip_header_error: 0
     rx_desc: 0
     sa_filter_fail: 0
     overflow_error: 0
     ipc_csum_error: 0
     rx_collision: 0
     rx_crc: 0
     dribbling_bit: 0
     rx_length: 0
     rx_mii: 0
     rx_multicast: 0
     rx_gmac_overflow: 0
     rx_watchdog: 0
     da_rx_filter_fail: 0
     sa_rx_filter_fail: 0
     rx_missed_cntr: 0
     rx_overflow_cntr: 0
     rx_vlan: 0
     tx_undeflow_irq: 0
     tx_process_stopped_irq: 0
     tx_jabber_irq: 0
     rx_overflow_irq: 0
     rx_buf_unav_irq: 0
     rx_process_stopped_irq: 0
     rx_watchdog_irq: 0
     tx_early_irq: 0
     fatal_bus_error_irq: 0
     rx_early_irq: 456
     threshold: 1
     tx_pkt_n: 29240
     rx_pkt_n: 807320
     normal_irq_n: 25764
     rx_normal_irq_n: 25307
     napi_poll: 25764
     tx_normal_irq_n: 457
     tx_clean: 25790
     tx_set_ic_bit: 457
     irq_receive_pmt_irq_n: 0
     mmc_tx_irq_n: 0
     mmc_rx_irq_n: 0
     mmc_rx_csum_offload_irq_n: 0
     irq_tx_path_in_lpi_mode_n: 0
     irq_tx_path_exit_lpi_mode_n: 0
     irq_rx_path_in_lpi_mode_n: 0
     irq_rx_path_exit_lpi_mode_n: 0
     phy_eee_wakeup_error_n: 0
     ip_hdr_err: 0
     ip_payload_err: 0
     ip_csum_bypassed: 0
     ipv4_pkt_rcvd: 0
     ipv6_pkt_rcvd: 0
     rx_msg_type_ext_no_ptp: 0
     rx_msg_type_sync: 0
     rx_msg_type_follow_up: 0
     rx_msg_type_delay_req: 0
     rx_msg_type_delay_resp: 0
     rx_msg_type_pdelay_req: 0
     rx_msg_type_pdelay_resp: 0
     rx_msg_type_pdelay_follow_up: 0
     ptp_frame_type: 0
     ptp_ver: 0
     timestamp_dropped: 0
     av_pkt_rcvd: 0
     av_tagged_pkt_rcvd: 0
     vlan_tag_priority_val: 0
     l3_filter_match: 0
     l4_filter_match: 0
     l3_l4_filter_no_match: 0
     irq_pcs_ane_n: 0
     irq_pcs_link_n: 0
     irq_rgmii_n: 1
     mtl_tx_status_fifo_full: 0
     mtl_tx_fifo_not_empty: 0
     mmtl_fifo_ctrl: 0
     mtl_tx_fifo_read_ctrl_write: 0
     mtl_tx_fifo_read_ctrl_wait: 0
     mtl_tx_fifo_read_ctrl_read: 0
     mtl_tx_fifo_read_ctrl_idle: 0
     mac_tx_in_pause: 0
     mac_tx_frame_ctrl_xfer: 0
     mac_tx_frame_ctrl_idle: 0
     mac_tx_frame_ctrl_wait: 0
     mac_tx_frame_ctrl_pause: 0
     mac_gmii_tx_proto_engine: 0
     mtl_rx_fifo_fill_level_full: 0
     mtl_rx_fifo_fill_above_thresh: 0
     mtl_rx_fifo_fill_below_thresh: 0
     mtl_rx_fifo_fill_level_empty: 0
     mtl_rx_fifo_read_ctrl_flush: 0
     mtl_rx_fifo_read_ctrl_read_data: 0
     mtl_rx_fifo_read_ctrl_status: 0
     mtl_rx_fifo_read_ctrl_idle: 0
     mtl_rx_fifo_ctrl_active: 0
     mac_rx_frame_ctrl_fifo: 0
     mac_gmii_rx_proto_engine: 0
     tx_tso_frames: 0
     tx_tso_nfrags: 0
# 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: stmmac-hack-disable-LPI.patch
Type: text/x-patch
Size: 2072 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20161001/f7914e10/attachment.bin>
