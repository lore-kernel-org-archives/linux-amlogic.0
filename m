Return-Path: <SRS0=Ba+r=QY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0417CC43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Feb 2019 14:49:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8A5E21929
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Feb 2019 14:49:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZCThMfYn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="AuoXOcvf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8A5E21929
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TWFMwJKRbRdfDKV8xtj9sFUTjKIJo3be9Zh5MPQ4NHo=; b=ZCThMfYnoOCEvr
	k3WdScXhlVUesRFtA1pPlhKgQR0HQzOBWMA+EHulxpcOwPiUAm4NC6HU5cqIBh1+dRnT+8IlRoc32
	mqKYwupvzcARXNH1ehlRlUO5/ivG2nXTmtBG8I3nvWxgivJDCUUhL9K6L7MSRZ+tHcZpu1cQnNFb0
	+O/gvUzMOL1CSZz8eAzs+zNRwm6uc/ZgRL5o+1U1lN58Yzvj++HB8Q6vKj9rYKbOHXPs7k3BRm6Ud
	xLb80B7hdmGGdbu8y7pzX5tlzv1zBCIyx7v/xqA0cj37YPG1iEB3vXC8KsvGjIgN3VRNISs4qzPhI
	otGd4vyxbH39FJSdRCZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvNkj-0006Bv-LG; Sun, 17 Feb 2019 14:49:09 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvNkh-0006Bb-0x
 for linux-amlogic@lists.infradead.org; Sun, 17 Feb 2019 14:49:08 +0000
Received: by mail-ot1-x333.google.com with SMTP id n8so24194160otl.6
 for <linux-amlogic@lists.infradead.org>; Sun, 17 Feb 2019 06:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NPfiRlOss3o1uJ92PSdfAvr5vIOSY3FtOflqXTzecFk=;
 b=AuoXOcvfFbesxqK5dahuzISptJTzwm6mVP1vkFvoTtLc0y5Hwt77QrKiV3kqY9492z
 8ShVDniiljvqi3Tec+VAEruPYOJM7MFcppYHzbpOobVqdxvwAii//xygzVJHZoAwUAxP
 nH5Dpq4BFFzK2IWedDhCB83vzLyE5kUkulFdD+fVyV+9Cy1h9FXkNKRHiOY4f4qtv6oE
 lQYOPyIdMLnRIbggxiWFxnGTBf+qmXzEkbUCKOiPEsBIlyYzGCFeb2cat92669cBFOud
 R+CbcdVyoSYHarW+QyvZI0A1aS7fWYIhem2f2j+8xnxop18jp3Fr3LJiDxgNEIunYYF/
 m2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NPfiRlOss3o1uJ92PSdfAvr5vIOSY3FtOflqXTzecFk=;
 b=PCRvwP6K8vfD7xxBRdmUJrTHrYQUEu4tFzrTWhNPJEQUa9nrhgMqjwA+exaJi264a6
 4spmLqQaY/ZJ+lrWDj1+QkobW5WnSfXgRAFMnKQDeQaV27YrXs4YMT+XjKHI1mAuZezL
 wAd1hvkaCgBIc9jhP9kDuX35JYhtVCrBOxO/4esXvPz2WuY8Oo6jsDFk0HK3PZb0pcYP
 /sdIIkRKjONrcwEcybXGq/Qombr6yNU2Pgxjzq56R1R8ist7XF86Wrkw2mABZfyZHfnp
 erbTLeyu72I06jZJt8VTZjFyynhkAywWwf/Fhu155cqtBi5DxHjx5i8ZsQpJrCUGzoCz
 zB4A==
X-Gm-Message-State: AHQUAuY7OBCz3xKvdfMedKr8YfvF7OgPdjVMgXWTuhBgb61uHG6+O5iI
 RvEGJpIxKPzRYEnZ5a7bhSl2Gr8HslsWL0rlXu8=
X-Google-Smtp-Source: AHgI3Ibg1+1NdiGfmhixjsn2wdzhZHlFrp0bMLs43MTtIDabVzlzvhubNo/giZfKlzl746QDNcUvc8JDkY+YIFrIyd8=
X-Received: by 2002:a9d:a48:: with SMTP id 66mr11866936otg.308.1550414945941; 
 Sun, 17 Feb 2019 06:49:05 -0800 (PST)
MIME-Version: 1.0
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <CAFBinCDebPOsmrhSXecx48nGWHh7g_OGPbr1Y0M+n_v9Ht91ew@mail.gmail.com>
 <e05b7448-cd95-cdeb-c88d-3a324d5f1ddc@gmx.de>
 <CAFBinCAkXN42piiYsc_Qmuqv0w4dbK86gq10AbZyrB-zKuh9hg@mail.gmail.com>
 <20190206103645.GA2482@ingrassia.epigenesys.com>
 <3001f244-8904-1e89-9595-62a65a7b32ae@gmx.de>
 <CAFBinCB1WUMOmaF6Wmr5HTutrgLOru5CRSnOpUUMMuVzHSa3Gg@mail.gmail.com>
 <330a523a-c1d6-4a99-3287-459096af0330@synopsys.com>
In-Reply-To: <330a523a-c1d6-4a99-3287-459096af0330@synopsys.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 17 Feb 2019 15:48:54 +0100
Message-ID: <CAFBinCAJwk5Go4ZEt2cqVKyfeeOxsa-+3pfLpzQo=XNr5u4Shw@mail.gmail.com>
Subject: Re: stmmac / meson8b-dwmac
To: Jose Abreu <jose.abreu@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190217_064907_064120_E9FD9CA5 
X-CRM114-Status: UNSURE (   7.30  )
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
Cc: alexandre.torgue@st.com, Gpeppe.cavallaro@st.com, netdev@vger.kernel.org,
 Simon Huelck <simonmail@gmx.de>, linux-amlogic@lists.infradead.org,
 Emiliano Ingrassia <ingrassia@epigenesys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Jose,

On Mon, Feb 11, 2019 at 2:45 PM Jose Abreu <jose.abreu@synopsys.com> wrote:
>
> Hello,
>
> On 2/9/2019 1:09 AM, Martin Blumenstingl wrote:
> > (it's interesting that the sending direction has 445 retries)
>
> I saw this before and I think it was related with COE. Can you
> please disable all offloading and try again?
OK, details are:

(before doing anything)
# ethtool -k eth0
Features for eth0:
rx-checksumming: on
tx-checksumming: on
       tx-checksum-ipv4: on
       tx-checksum-ip-generic: off [fixed]
       tx-checksum-ipv6: on
       tx-checksum-fcoe-crc: off [fixed]
       tx-checksum-sctp: off [fixed]
scatter-gather: on
       tx-scatter-gather: on
       tx-scatter-gather-fraglist: off [fixed]
tcp-segmentation-offload: off
       tx-tcp-segmentation: off [fixed]
       tx-tcp-ecn-segmentation: off [fixed]
       tx-tcp-mangleid-segmentation: off [fixed]
       tx-tcp6-segmentation: off [fixed]
udp-fragmentation-offload: off
generic-segmentation-offload: on
generic-receive-offload: on
large-receive-offload: off [fixed]
rx-vlan-offload: off [fixed]
tx-vlan-offload: off [fixed]
ntuple-filters: off [fixed]
receive-hashing: off [fixed]
highdma: on [fixed]
rx-vlan-filter: off [fixed]
vlan-challenged: off [fixed]
tx-lockless: off [fixed]
netns-local: off [fixed]
tx-gso-robust: off [fixed]
tx-fcoe-segmentation: off [fixed]
tx-gre-segmentation: off [fixed]
tx-gre-csum-segmentation: off [fixed]
tx-ipxip4-segmentation: off [fixed]
tx-ipxip6-segmentation: off [fixed]
tx-udp_tnl-segmentation: off [fixed]
tx-udp_tnl-csum-segmentation: off [fixed]
tx-gso-partial: off [fixed]
tx-sctp-segmentation: off [fixed]
tx-esp-segmentation: off [fixed]
tx-udp-segmentation: off [fixed]
fcoe-mtu: off [fixed]
tx-nocache-copy: off
loopback: off [fixed]
rx-fcs: off [fixed]
rx-all: off [fixed]
tx-vlan-stag-hw-insert: off [fixed]
rx-vlan-stag-hw-parse: off [fixed]
rx-vlan-stag-filter: off [fixed]
l2-fwd-offload: off [fixed]
hw-tc-offload: off [fixed]
esp-hw-offload: off [fixed]
esp-tx-csum-hw-offload: off [fixed]
rx-udp_tunnel-port-offload: off [fixed]
tls-hw-tx-offload: off [fixed]
tls-hw-rx-offload: off [fixed]
rx-gro-hw: off [fixed]
tls-hw-record: off [fixed]

this causes retries when running iperf3 in transmit mode.

with offloading disabled:

# ethtool -K eth0 rx off tx off
# ethtool -k eth0
Features for eth0:
rx-checksumming: off
tx-checksumming: off
       tx-checksum-ipv4: off
       tx-checksum-ip-generic: off [fixed]
       tx-checksum-ipv6: off
       tx-checksum-fcoe-crc: off [fixed]
       tx-checksum-sctp: off [fixed]
scatter-gather: on
       tx-scatter-gather: on
       tx-scatter-gather-fraglist: off [fixed]
tcp-segmentation-offload: off
       tx-tcp-segmentation: off [fixed]
       tx-tcp-ecn-segmentation: off [fixed]
       tx-tcp-mangleid-segmentation: off [fixed]
       tx-tcp6-segmentation: off [fixed]
udp-fragmentation-offload: off
generic-segmentation-offload: on
generic-receive-offload: on
large-receive-offload: off [fixed]
rx-vlan-offload: off [fixed]
tx-vlan-offload: off [fixed]
ntuple-filters: off [fixed]
receive-hashing: off [fixed]
highdma: on [fixed]
rx-vlan-filter: off [fixed]
vlan-challenged: off [fixed]
tx-lockless: off [fixed]
netns-local: off [fixed]
tx-gso-robust: off [fixed]
tx-fcoe-segmentation: off [fixed]
tx-gre-segmentation: off [fixed]
tx-gre-csum-segmentation: off [fixed]
tx-ipxip4-segmentation: off [fixed]
tx-ipxip6-segmentation: off [fixed]
tx-udp_tnl-segmentation: off [fixed]
tx-udp_tnl-csum-segmentation: off [fixed]
tx-gso-partial: off [fixed]
tx-sctp-segmentation: off [fixed]
tx-esp-segmentation: off [fixed]
tx-udp-segmentation: off [fixed]
fcoe-mtu: off [fixed]
tx-nocache-copy: off
loopback: off [fixed]
rx-fcs: off [fixed]
rx-all: off [fixed]
tx-vlan-stag-hw-insert: off [fixed]
rx-vlan-stag-hw-parse: off [fixed]
rx-vlan-stag-filter: off [fixed]
l2-fwd-offload: off [fixed]
hw-tc-offload: off [fixed]
esp-hw-offload: off [fixed]
esp-tx-csum-hw-offload: off [fixed]
rx-udp_tunnel-port-offload: off [fixed]
tls-hw-tx-offload: off [fixed]
tls-hw-rx-offload: off [fixed]
rx-gro-hw: off [fixed]
tls-hw-record: off [fixed]
# iperf3 -c 192.168.1.100
Connecting to host 192.168.1.100, port 5201
[  5] local 192.168.1.131 port 58412 connected to 192.168.1.100 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   112 MBytes   937 Mbits/sec   32   59.4 KBytes
[  5]   1.00-2.00   sec   112 MBytes   937 Mbits/sec   25    290 KBytes
[  5]   2.00-3.00   sec   109 MBytes   915 Mbits/sec  150    279 KBytes
[  5]   3.00-4.00   sec   112 MBytes   941 Mbits/sec    0    334 KBytes
[  5]   4.00-5.00   sec   112 MBytes   941 Mbits/sec    0    342 KBytes
[  5]   5.00-6.00   sec   111 MBytes   934 Mbits/sec   98    320 KBytes
[  5]   6.00-7.00   sec   111 MBytes   929 Mbits/sec  123   76.4 KBytes
[  5]   7.00-8.00   sec   109 MBytes   917 Mbits/sec  119    277 KBytes
[  5]   8.00-9.00   sec   112 MBytes   941 Mbits/sec    0    314 KBytes
[  5]   9.00-10.00  sec   112 MBytes   940 Mbits/sec    0    318 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.09 GBytes   933 Mbits/sec  547             sender
[  5]   0.00-10.04  sec  1.09 GBytes   929 Mbits/sec                  receiver

iperf Done.

so for me disabling offloading didn't change anything.

Jose, is my command for disabling offloading correct?
Simon, does disabling offloading improve anything in your iperf2 or
real-world scenario on a kernel where you previously had performance
issues?


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
