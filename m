Return-Path: <SRS0=Ba+r=QY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FE8C43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Feb 2019 19:13:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFBBB21874
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Feb 2019 19:13:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E8Xs3ptc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFBBB21874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/7F8V9KNdhZEWjPCFfsjU3g5B0yBOyPT5BnryWOHgK4=; b=E8Xs3ptcAzI8a0
	CMJ0AG/Qi8U1r69DwQPe61M70zYoow4gIJmr808L1wvaoxH2E1n83A6eWSBI6tB8dnr1X/WmZZYpI
	jNz55zev96m/cFBukKX9UQGomJfl3hv41UCh1wSWkZCcsJk35CN+qGV0T+NaT2QeQDob2UeiSjWa2
	CQjCduJzwF2nzFxG+YBwxOEVR6W3tEl75mzx8M18i0gABC1axvnNuxQTp//YuW9RocAaKXqgwjNLc
	LqOFTxd25PHe36w2IJ17LQFPl1fr+VByquq4SFcjRqkbX8vfnFcxWIedh5qybocf/gG/7CT+f0SPd
	xGtccCeGrc2U6QyM5xMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvRsp-0008EV-Q7; Sun, 17 Feb 2019 19:13:47 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvRsm-0008Dx-Pm
 for linux-amlogic@lists.infradead.org; Sun, 17 Feb 2019 19:13:46 +0000
Received: from [10.10.11.100] ([95.88.178.171]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0M5Lmp-1hGY3p0dTz-00zYc1; Sun, 17
 Feb 2019 20:13:30 +0100
Subject: Re: stmmac / meson8b-dwmac
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jose Abreu <jose.abreu@synopsys.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <CAFBinCDebPOsmrhSXecx48nGWHh7g_OGPbr1Y0M+n_v9Ht91ew@mail.gmail.com>
 <e05b7448-cd95-cdeb-c88d-3a324d5f1ddc@gmx.de>
 <CAFBinCAkXN42piiYsc_Qmuqv0w4dbK86gq10AbZyrB-zKuh9hg@mail.gmail.com>
 <20190206103645.GA2482@ingrassia.epigenesys.com>
 <3001f244-8904-1e89-9595-62a65a7b32ae@gmx.de>
 <CAFBinCB1WUMOmaF6Wmr5HTutrgLOru5CRSnOpUUMMuVzHSa3Gg@mail.gmail.com>
 <330a523a-c1d6-4a99-3287-459096af0330@synopsys.com>
 <CAFBinCAJwk5Go4ZEt2cqVKyfeeOxsa-+3pfLpzQo=XNr5u4Shw@mail.gmail.com>
From: Simon Huelck <simonmail@gmx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=simonmail@gmx.de; prefer-encrypt=mutual; keydata=
 mQGiBD/bCNARBACE3URTBXZ/AA03NwRNtz03ewQn3uhvYSTjfqgplBtb3dfC4a79BXDRIWVX
 xPGH9Ewios1c8gMu3/RI2l3JzXoISfw5b0L/5igyPKV+sGuUA2FD27kYtPaaF/TqEWIv+Yxp
 9DCjCX5IQSYyvCfcxcyEkY8eVWxnaAlV3zKRR8wn0wCglWIOtAugBcg1YXmoLpFZE8Ca0fkD
 /jG+n4U9DPfCgkbgjQ/dv2W2a0ZDHccA9N8AW/FTXGyXXO0e7ql9/kORJnp7jD7/Z9HCKpeS
 HajgxuX9Vhfx6bH1dAMfsg88+K8pOO9oulNX1+YffQyZWOfdbmnZDUzBt9HKR9Wgh8WoIyw9
 TVluclzn6hYz+z9jbqHWMOsiCu8zA/0apHbW8vaIDT4+nNUxNdqU1TKa9kW47vNjwYYL0jZW
 TXNjDIRpqJVSugYVc/U847GoVoxyvtzre4TAbBV8h0BAOeMdxI5En67RGWzeNaMDJV1bwapj
 qdfj3e/X8rnGIfwz47rwztLNKoAIUlKrATwroiI7UNT+84G7H5qalu+Eu7QqU2ltb24gSHVl
 bGNrIDxzaW1vbi5odWVsY2tAZ29vZ2xlbWFpbC5jb20+iGIEExECACIFAlH7wL4CGyMGCwkI
 BwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEJNSVvfBt05KlBQAn1JDO7e4H3N0WFJkZnxvObhk
 2kiAAJwPdDd6T1TuGo4iDIENRhAX4AH2KrkBDQQ/2wjSEAQAj6JnDDQzIIYzPGsrHRvaq8vw
 n8VrZCbPRvkngGvtQIss5pH/MLeu9jLepDGO9WHByFSg4QJh8cINYwTLtX8Bu0naA6ZI46hn
 GyfxdRlxSU9dRqHpU3G0tymL1w3AER6aVSfdXQTmFgf61anKunbIIptkqzZurkjnxkwCE/RM
 RscABA0D/jhglpj8siSIAxs8XLVfKJrjzbYM9/wS0NfdSXBeQJiYtKrY0WMNsqjY50wDnLMg
 anORN/odT6mCwKI6xChzxEv/ta4+teZl92aitziSuqmtl+jm23DpOcUC7UBz2W1+TvnrhPR+
 MKu8pPKAgsE8AI5uwCcNJx7V3bczYkIGaXybiEYEGBECAAYFAj/bCNIACgkQk1JW98G3Tko6
 3wCfZBpZAUhUz/Rcp2rfg/YSKl4YLlEAoJN7e322OvHc2GQ9n1+tKLi6Og4c
Message-ID: <b700590a-76ce-d836-c31d-4b220874e238@gmx.de>
Date: Sun, 17 Feb 2019 20:13:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCAJwk5Go4ZEt2cqVKyfeeOxsa-+3pfLpzQo=XNr5u4Shw@mail.gmail.com>
X-Provags-ID: V03:K1:fib3W/Cj8xyIKKZV3BaOgFxjXlhGQpmA10WynQqwr3q1BxFDKAn
 Y0hMbA0mIchdONQo/AI3ywyR28JCjnF95Tk5mRvLwdbBVJwXTefZDmAWTAa/8APb0Zr2/qj
 4NdoFVD5rObrvE7aTVvSxetU9SUcFPbW2ZY+y10VG+yFSJ1cP3u1ti4EqkCmCE2WOf5FJX7
 4M44moodGWmAkkOsWyUEQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S/8iOqAYZxU=:3eeFBp8jeGKkRYr1loc/CT
 VCdO/iL/I6OQvpbU+yud2YH+1AEZLwbvme6fhS7VKgWZSCfABzVq5vs+uWyGYyPLBhOeI6fhK
 ac6m2OWlsPMIhPIZMfErT2A4aMS+ppYPGTTzQ2dOG9NRZuSgWv8dVyrf97e7XbPNL/v2JMGP8
 ntyiQl8OYeVtiBFyks5p/+riUu4bKjPlgcnxZ/VSvNqsriawUeq+R6DWOtSRBbW/3zFZ7DkM7
 301SDAzIbMLpmnXWVSw2fqblqexb0D0T3KI38xqMsKi8lrZ9IvlK8gLBipKXDeQwXyzHhMPsc
 F7zUce4Grp79eksRap4IgjrHbLgANyPqdB/9Od1CqFxECK9BPm3sblMID8ry22LpfQ6cXE8DI
 0miRj8pvJT2yckF9SZg+9ljrRtgmEJUE8LAcCJlo4d3tcueBGD7Mjn1gjQkuCKca3na9ThytJ
 043+09S4/tnO6OZR4OiomH9Kj9nV0Gs/6GiMOb7LrJp5mNdCf7Afps5ECdqZO3PnhyTyu2epm
 ER3Zy8SZjBC165e8BQejrNHejG71Q9neXdJ3HKmZU490A7lsC5YuDdnOSKtWfcS4u2GrAjCwI
 WMivPTsl9knEH+A5F33m1JpdUKtHOZ8KIabfsKDnyaig5wr0xfEd711HC9d3s5SV6777iy0YP
 aybX1NnxKcZYFNF0aa4Z2+IT6kgRMFI1S9KzBfwuo4RFIE3E8X6+8OVA2r+kn7jmhcRiRJfRB
 Q8qZbU4rEAO0/Vk9FsuLrgTHCT85oEoOBtQ+0bmZRKfBkLbyTL5bjt7UwUiLFTo1HpV7+h6QQ
 AshwTG1aNYhwCOmYPfhOZKIb6nmP0z7QWtNEg6s0Cul5mMMiamIgigogUv6K5OdYwBeJSUmWI
 pXUrlpkIvoCJEPXUlOAsImDXr+m3RJFg0fH61MT2163To2c3xNeHSuiG1SXCUD6cWld05zy/r
 oVgqO8Ey+yQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190217_111345_142456_32DADF46 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, netdev@vger.kernel.org,
 alexandre.torgue@st.com, Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Gpeppe.cavallaro@st.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,


i repeated your commands , nothing changed the problematic result ....


regards,
Simon

Am 17.02.2019 um 15:48 schrieb Martin Blumenstingl:
> Hello Jose,
>
> On Mon, Feb 11, 2019 at 2:45 PM Jose Abreu <jose.abreu@synopsys.com> wrote:
>> Hello,
>>
>> On 2/9/2019 1:09 AM, Martin Blumenstingl wrote:
>>> (it's interesting that the sending direction has 445 retries)
>> I saw this before and I think it was related with COE. Can you
>> please disable all offloading and try again?
> OK, details are:
>
> (before doing anything)
> # ethtool -k eth0
> Features for eth0:
> rx-checksumming: on
> tx-checksumming: on
>        tx-checksum-ipv4: on
>        tx-checksum-ip-generic: off [fixed]
>        tx-checksum-ipv6: on
>        tx-checksum-fcoe-crc: off [fixed]
>        tx-checksum-sctp: off [fixed]
> scatter-gather: on
>        tx-scatter-gather: on
>        tx-scatter-gather-fraglist: off [fixed]
> tcp-segmentation-offload: off
>        tx-tcp-segmentation: off [fixed]
>        tx-tcp-ecn-segmentation: off [fixed]
>        tx-tcp-mangleid-segmentation: off [fixed]
>        tx-tcp6-segmentation: off [fixed]
> udp-fragmentation-offload: off
> generic-segmentation-offload: on
> generic-receive-offload: on
> large-receive-offload: off [fixed]
> rx-vlan-offload: off [fixed]
> tx-vlan-offload: off [fixed]
> ntuple-filters: off [fixed]
> receive-hashing: off [fixed]
> highdma: on [fixed]
> rx-vlan-filter: off [fixed]
> vlan-challenged: off [fixed]
> tx-lockless: off [fixed]
> netns-local: off [fixed]
> tx-gso-robust: off [fixed]
> tx-fcoe-segmentation: off [fixed]
> tx-gre-segmentation: off [fixed]
> tx-gre-csum-segmentation: off [fixed]
> tx-ipxip4-segmentation: off [fixed]
> tx-ipxip6-segmentation: off [fixed]
> tx-udp_tnl-segmentation: off [fixed]
> tx-udp_tnl-csum-segmentation: off [fixed]
> tx-gso-partial: off [fixed]
> tx-sctp-segmentation: off [fixed]
> tx-esp-segmentation: off [fixed]
> tx-udp-segmentation: off [fixed]
> fcoe-mtu: off [fixed]
> tx-nocache-copy: off
> loopback: off [fixed]
> rx-fcs: off [fixed]
> rx-all: off [fixed]
> tx-vlan-stag-hw-insert: off [fixed]
> rx-vlan-stag-hw-parse: off [fixed]
> rx-vlan-stag-filter: off [fixed]
> l2-fwd-offload: off [fixed]
> hw-tc-offload: off [fixed]
> esp-hw-offload: off [fixed]
> esp-tx-csum-hw-offload: off [fixed]
> rx-udp_tunnel-port-offload: off [fixed]
> tls-hw-tx-offload: off [fixed]
> tls-hw-rx-offload: off [fixed]
> rx-gro-hw: off [fixed]
> tls-hw-record: off [fixed]
>
> this causes retries when running iperf3 in transmit mode.
>
> with offloading disabled:
>
> # ethtool -K eth0 rx off tx off
> # ethtool -k eth0
> Features for eth0:
> rx-checksumming: off
> tx-checksumming: off
>        tx-checksum-ipv4: off
>        tx-checksum-ip-generic: off [fixed]
>        tx-checksum-ipv6: off
>        tx-checksum-fcoe-crc: off [fixed]
>        tx-checksum-sctp: off [fixed]
> scatter-gather: on
>        tx-scatter-gather: on
>        tx-scatter-gather-fraglist: off [fixed]
> tcp-segmentation-offload: off
>        tx-tcp-segmentation: off [fixed]
>        tx-tcp-ecn-segmentation: off [fixed]
>        tx-tcp-mangleid-segmentation: off [fixed]
>        tx-tcp6-segmentation: off [fixed]
> udp-fragmentation-offload: off
> generic-segmentation-offload: on
> generic-receive-offload: on
> large-receive-offload: off [fixed]
> rx-vlan-offload: off [fixed]
> tx-vlan-offload: off [fixed]
> ntuple-filters: off [fixed]
> receive-hashing: off [fixed]
> highdma: on [fixed]
> rx-vlan-filter: off [fixed]
> vlan-challenged: off [fixed]
> tx-lockless: off [fixed]
> netns-local: off [fixed]
> tx-gso-robust: off [fixed]
> tx-fcoe-segmentation: off [fixed]
> tx-gre-segmentation: off [fixed]
> tx-gre-csum-segmentation: off [fixed]
> tx-ipxip4-segmentation: off [fixed]
> tx-ipxip6-segmentation: off [fixed]
> tx-udp_tnl-segmentation: off [fixed]
> tx-udp_tnl-csum-segmentation: off [fixed]
> tx-gso-partial: off [fixed]
> tx-sctp-segmentation: off [fixed]
> tx-esp-segmentation: off [fixed]
> tx-udp-segmentation: off [fixed]
> fcoe-mtu: off [fixed]
> tx-nocache-copy: off
> loopback: off [fixed]
> rx-fcs: off [fixed]
> rx-all: off [fixed]
> tx-vlan-stag-hw-insert: off [fixed]
> rx-vlan-stag-hw-parse: off [fixed]
> rx-vlan-stag-filter: off [fixed]
> l2-fwd-offload: off [fixed]
> hw-tc-offload: off [fixed]
> esp-hw-offload: off [fixed]
> esp-tx-csum-hw-offload: off [fixed]
> rx-udp_tunnel-port-offload: off [fixed]
> tls-hw-tx-offload: off [fixed]
> tls-hw-rx-offload: off [fixed]
> rx-gro-hw: off [fixed]
> tls-hw-record: off [fixed]
> # iperf3 -c 192.168.1.100
> Connecting to host 192.168.1.100, port 5201
> [  5] local 192.168.1.131 port 58412 connected to 192.168.1.100 port 5201
> [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> [  5]   0.00-1.00   sec   112 MBytes   937 Mbits/sec   32   59.4 KBytes
> [  5]   1.00-2.00   sec   112 MBytes   937 Mbits/sec   25    290 KBytes
> [  5]   2.00-3.00   sec   109 MBytes   915 Mbits/sec  150    279 KBytes
> [  5]   3.00-4.00   sec   112 MBytes   941 Mbits/sec    0    334 KBytes
> [  5]   4.00-5.00   sec   112 MBytes   941 Mbits/sec    0    342 KBytes
> [  5]   5.00-6.00   sec   111 MBytes   934 Mbits/sec   98    320 KBytes
> [  5]   6.00-7.00   sec   111 MBytes   929 Mbits/sec  123   76.4 KBytes
> [  5]   7.00-8.00   sec   109 MBytes   917 Mbits/sec  119    277 KBytes
> [  5]   8.00-9.00   sec   112 MBytes   941 Mbits/sec    0    314 KBytes
> [  5]   9.00-10.00  sec   112 MBytes   940 Mbits/sec    0    318 KBytes
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID] Interval           Transfer     Bitrate         Retr
> [  5]   0.00-10.00  sec  1.09 GBytes   933 Mbits/sec  547             sender
> [  5]   0.00-10.04  sec  1.09 GBytes   929 Mbits/sec                  receiver
>
> iperf Done.
>
> so for me disabling offloading didn't change anything.
>
> Jose, is my command for disabling offloading correct?
> Simon, does disabling offloading improve anything in your iperf2 or
> real-world scenario on a kernel where you previously had performance
> issues?
>
>
> Regards
> Martin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
