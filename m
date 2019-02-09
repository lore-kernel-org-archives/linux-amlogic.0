Return-Path: <SRS0=GL6B=QQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B04C3C169C4
	for <linux-amlogic@archiver.kernel.org>; Sat,  9 Feb 2019 01:09:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AFD9217D8
	for <linux-amlogic@archiver.kernel.org>; Sat,  9 Feb 2019 01:09:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DuIDCGnE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="JZAau44L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AFD9217D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OoZ6Df7hZwdJZ2eflQSsq8SX/NWZ5ONC4TVtCzjjvg4=; b=DuIDCGnEsufUsF
	npi+hE23H86abINDiO/RezL1Jz+g4AsZT8zYv1nKUkWSDdEg/bdbK3Ceo/ePOVgk9fYCD5V8RHzIM
	Dl8XK2Z7skowS1Wik8e/GsNOySZt9ZgAudMs+IhjCol9k+P3BncGOjfjUqyIrpW064WLgsFahpy8E
	4wO1a6uk7X0R8J1eY3nMsVRtMxKmb+gJow1AOaJGVCEbLq+ff8g46lN9L9vjBeNTtABy8y63oN4Oi
	d7bS8Qb7+YFItouSPRHj4DOskCBiBCGH2JvNjkkOMvybSG3VNYXHjBMPDArUyW0+o/nbeyVycetvP
	XdTAB4By/XEEVCte0mdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsH98-0004dh-Px; Sat, 09 Feb 2019 01:09:30 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsH95-0004dP-14
 for linux-amlogic@lists.infradead.org; Sat, 09 Feb 2019 01:09:28 +0000
Received: by mail-ot1-x329.google.com with SMTP id t5so9083775otk.1
 for <linux-amlogic@lists.infradead.org>; Fri, 08 Feb 2019 17:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t2RwZ/qvtTUCZARVCn/TTpLSr+Oj4xKFZV2RCB893f4=;
 b=JZAau44LYlLXZch16144NNHraeJ9Sq8/uqzdL7jZ9THZ9AGYUKMg3G/7sOSRKd5j7C
 fJmkSgwwSWvCQ5Fnz0CkXFjU9cUym7sxljUriLt7AHx79LukDT9C1bzYpR/SfMDZ4EIK
 Q6zy4R2E1X1oCNP+o4aGVJmgTPWJhq8YekioBZQbsxRVu1avn1WHQ58TMD9D/daPrvyu
 cJRZpLrPnXnmb7Gl4kkt6ZXcl+zGQaJnGmHbL9AK5nFKPAvPCSafekonAOcdFYr41YUc
 qEEb6v5thAkODCDyNOIFcU4+Ds+yTEFGYjRhi1jjwQzROxD8t9Sj13IhLYCdv4TMQSZS
 om9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t2RwZ/qvtTUCZARVCn/TTpLSr+Oj4xKFZV2RCB893f4=;
 b=dVdbBklwYRlJHadkxUjGcGVO9KyGrQ7sspRhFn5I2cOf94S3mVEkTiHx16nRYIEcBP
 VnUSSraxK6nnqTDzYwaBtZxPp+7L8TrVF2JCb2QclIi5ytonOgvkjgLzMnKWO84Rxrno
 12QghFRxF9lLzvq+QTEViGH1BcEA1lMstK4tcAv2TM3v2UxdaHa0TcMOHjoh37Cf8Rtu
 ZatLSitR7jr+V4ybSFgcRn0F0kMHNF0Ju2h/qgi6f3MKEFm3XBlI/h7m5BmvuvUlTX33
 BNYnFvAmiySs+QEGN+FfpeneFOR/sccHIqlW8QWfv5JQZ7pbOpr+UXOawN0GwJUioWzl
 E2Mw==
X-Gm-Message-State: AHQUAubyX3OnVdMTGfV6GnGcDjqzKHOHwkxzkxRRLit9/psjqyDUNm2f
 ZOO4AzNVeBZYfH/myZw+fw0SUWuhsqaemRdXQoI=
X-Google-Smtp-Source: AHgI3IZcNgBrbFj9oCAwgk4xum4kvfHgJwWWzX3Shw8xha0nObB79FAMN46+sPZnNsqWbj2vOwEBK9EsZHA8ruav2n4=
X-Received: by 2002:a05:6830:2010:: with SMTP id
 e16mr15194751otp.86.1549674565848; 
 Fri, 08 Feb 2019 17:09:25 -0800 (PST)
MIME-Version: 1.0
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <CAFBinCDebPOsmrhSXecx48nGWHh7g_OGPbr1Y0M+n_v9Ht91ew@mail.gmail.com>
 <e05b7448-cd95-cdeb-c88d-3a324d5f1ddc@gmx.de>
 <CAFBinCAkXN42piiYsc_Qmuqv0w4dbK86gq10AbZyrB-zKuh9hg@mail.gmail.com>
 <20190206103645.GA2482@ingrassia.epigenesys.com>
 <3001f244-8904-1e89-9595-62a65a7b32ae@gmx.de>
In-Reply-To: <3001f244-8904-1e89-9595-62a65a7b32ae@gmx.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 9 Feb 2019 02:09:14 +0100
Message-ID: <CAFBinCB1WUMOmaF6Wmr5HTutrgLOru5CRSnOpUUMMuVzHSa3Gg@mail.gmail.com>
Subject: Re: stmmac / meson8b-dwmac
To: Simon Huelck <simonmail@gmx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_170927_131439_10AA34C4 
X-CRM114-Status: UNSURE (   9.90  )
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

Hi Simon,

On Thu, Feb 7, 2019 at 8:30 PM Simon Huelck <simonmail@gmx.de> wrote:
>
> Hi Guys,
>
>
> i can confirm better performance with 4.14.29
>
> - ~900 MBits with iperf2 in one way
> -~ 500 - 600MBits with iperf2 in duplex in both directions
>
>
> This wasnt the case with 4.17.9, not with 4.18, 4.19 or the 5.0 series.....
I just did a small test myself on a Khadas VIM2:
# iperf3 -c 192.168.1.100
Connecting to host 192.168.1.100, port 5201
[  5] local 192.168.1.189 port 37192 connected to 192.168.1.100 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   113 MBytes   946 Mbits/sec    0    354 KBytes
[  5]   1.00-2.00   sec   112 MBytes   940 Mbits/sec    0    354 KBytes
[  5]   2.00-3.00   sec   110 MBytes   920 Mbits/sec  241    228 KBytes
[  5]   3.00-4.00   sec   112 MBytes   940 Mbits/sec    0    314 KBytes
[  5]   4.00-5.00   sec   111 MBytes   933 Mbits/sec   89   83.4 KBytes
[  5]   5.00-6.00   sec   110 MBytes   926 Mbits/sec  115    335 KBytes
[  5]   6.00-7.00   sec   112 MBytes   941 Mbits/sec    0    358 KBytes
[  5]   7.00-8.00   sec   112 MBytes   941 Mbits/sec    0    362 KBytes
[  5]   8.00-9.00   sec   112 MBytes   941 Mbits/sec    0    369 KBytes
[  5]   9.00-10.00  sec   112 MBytes   942 Mbits/sec    0    372 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.09 GBytes   937 Mbits/sec  445             sender
[  5]   0.00-10.04  sec  1.09 GBytes   932 Mbits/sec                  receiver

iperf Done.

(it's interesting that the sending direction has 445 retries)

# iperf3 -c 192.168.1.100 -R
Connecting to host 192.168.1.100, port 5201
Reverse mode, remote host 192.168.1.100 is sending
[  5] local 192.168.1.189 port 37196 connected to 192.168.1.100 port 5201
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec  90.9 MBytes   763 Mbits/sec
[  5]   1.00-2.00   sec  90.9 MBytes   762 Mbits/sec
[  5]   2.00-3.00   sec  90.7 MBytes   760 Mbits/sec
[  5]   3.00-4.00   sec  91.3 MBytes   766 Mbits/sec
[  5]   4.00-5.00   sec  91.1 MBytes   764 Mbits/sec
[  5]   5.00-6.00   sec  91.1 MBytes   765 Mbits/sec
[  5]   6.00-7.00   sec  90.8 MBytes   762 Mbits/sec
[  5]   7.00-8.00   sec  90.9 MBytes   762 Mbits/sec
[  5]   8.00-9.00   sec  91.0 MBytes   764 Mbits/sec
[  5]   9.00-10.00  sec  91.3 MBytes   766 Mbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.04  sec   911 MBytes   762 Mbits/sec    0             sender
[  5]   0.00-10.00  sec   910 MBytes   763 Mbits/sec                  receiver

iperf Done.

(when receiving I see no retries)

for my test I used my Khadas VIM2 (as I don't have a GXBB board anymore).
test setup: PC -> built-in switch in some ath79 based OpenWrt device
-> VIM2. no VLANs are used
revision: latest mainline, which at the time of testing is:
46c291e277f937378 ("Merge tag 'armsoc-fixes-5.0' of
git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc")

> How can i help further ?
it's good to know that 4.14 has "good" performance in your scenario
can you please show the full iperf outputs for your tests (preferably
on both, 4.14 and 5.0-rcX)?

do you see any improvements on 5.0-rcX when not using VLANs (this is
just a random guess)?


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
