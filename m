Return-Path: <SRS0=vGLM=Q2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C98C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Feb 2019 08:48:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CD0E21903
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Feb 2019 08:48:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W6yUoQoh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hspTZxog"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CD0E21903
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKT4Kpd7K115JJTQ38qDDHpf6nZ7VIATs5OQW4wpiW0=; b=W6yUoQohULHtLW
	ixOyReNRiC5cXYmIknJkoiToLdLumX2bgOLID9Mb4GYRGCyvU+C40YTz2SD+VZLWWYm85AhSbaqzZ
	UjWu/RvzWnpXoXa5iRN1opNSyngwqyN+yRlPT7QA91umRYIHuYZr0JkYOitcvGd38XWLOvoaaqjU2
	M960oxSoaK+66/sSE0rhQW1zfbpj+19RVZRwgJw1SkG69Wbspv2cuULxb6tg+/8XMxw5/5jMkzfxi
	M/qQiVtk9xbsE4TeCOSxPh9YkL2XUD5pQRXJFGo3mWkz/O6t509zVT9bX7Q3lESQCKHxznsOZqLUo
	kNaQckiMP+2IYAsUxC1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gw14G-0001lO-8X; Tue, 19 Feb 2019 08:47:56 +0000
Received: from smtprelay2.synopsys.com ([198.182.60.111]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gw14D-0001kb-9p
 for linux-amlogic@lists.infradead.org; Tue, 19 Feb 2019 08:47:54 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id 4644A10C189C;
 Tue, 19 Feb 2019 00:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1550566070; bh=ZW4D6vPPjgSd4kZnmFfdKMeGrQJpQ/gSvdI/N0E8goU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To:From;
 b=hspTZxogCIxrYtpYZ7GHaTdqMsU6P0dNzSKdWyBBahByajQEFCyadefnYHPeaRIQ3
 gcrmETpnV7Mr5gOwPHlGEpyGIdAA81RYcpnQYwvhMDLrx3LmtasosLMCVLymcyMOVt
 i0+qGfZyWFDhrSJG8/tmK+DB8wrAOiF/SKHjOfcDNPAZD5lPtC3tO5Iqk3dITCFsDf
 T55w2vwqeS6xPGd2F33Ra2q38iJQ+Z6h8GAlpV4IrVKqovBPe31U5FmetXTkLlD5ay
 6jwncDKGoEKtVa4GkHZYllGrtv2MbMJbc7tsZjgB5Ha294EW4q9PqgK9gQl7uJ8d2g
 j0pniErYkjFSw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 817DDA006A;
 Tue, 19 Feb 2019 08:47:48 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 19 Feb 2019 00:47:48 -0800
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 DE02WEHTCB.internal.synopsys.com (10.225.19.94) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 19 Feb 2019 09:47:46 +0100
Received: from [10.107.19.176] (10.107.19.176) by
 DE02WEHTCA.internal.synopsys.com (10.225.19.80) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 19 Feb 2019 09:47:45 +0100
Subject: Re: stmmac / meson8b-dwmac
To: Simon Huelck <simonmail@gmx.de>, Jose Abreu <jose.abreu@synopsys.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <3001f244-8904-1e89-9595-62a65a7b32ae@gmx.de>
 <CAFBinCB1WUMOmaF6Wmr5HTutrgLOru5CRSnOpUUMMuVzHSa3Gg@mail.gmail.com>
 <330a523a-c1d6-4a99-3287-459096af0330@synopsys.com>
 <CAFBinCAJwk5Go4ZEt2cqVKyfeeOxsa-+3pfLpzQo=XNr5u4Shw@mail.gmail.com>
 <2abbf79a-cdff-b6a7-42de-79ea2c6ab367@synopsys.com>
 <c80c1e5b-fed9-25ce-eb1b-258ac0135ce7@synopsys.com>
 <7afdaa0d-d0ef-b223-1f6e-2b52bfa44784@gmx.de>
 <6f25da2b-7f28-b888-3240-7178ac75c90c@synopsys.com>
 <84fb981c-75ab-ef9e-edd6-cd0c52d9dc36@synopsys.com>
 <cd344fa3-758f-3824-ddd3-568ce837c4f7@gmx.de>
 <8bae9cd6-5c44-30e3-bfe5-8d6f853f170e@synopsys.com>
 <065407cd-c13b-e74c-7798-508650c12caf@gmx.de>
 <227be4e9-b0cc-a011-2558-71a17567246f@synopsys.com>
 <45e73e8c-a0fb-6f8f-8dc6-3aa2103fdda3@gmx.de>
 <e1d75e7f-1747-d0ce-0ee7-4fa688b90d13@synopsys.com>
 <4493b245-de93-46cd-327b-8091a3babc3a@gmx.de>
 <adafe6d7-e619-45e9-7ecb-76f003b0c7d9@synopsys.com>
 <cd0b3dec-af3f-af69-50b7-6ca6f7256900@gmx.de>
From: Jose Abreu <jose.abreu@synopsys.com>
Message-ID: <fa35fb4a-b9d5-9bbb-437d-47e8819d0f27@synopsys.com>
Date: Tue, 19 Feb 2019 08:47:44 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <cd0b3dec-af3f-af69-50b7-6ca6f7256900@gmx.de>
Content-Language: en-US
X-Originating-IP: [10.107.19.176]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190219_004753_352266_B9BBD3E2 
X-CRM114-Status: UNSURE (   9.75  )
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

On 2/18/2019 6:05 PM, Simon Huelck wrote:
> disabling EEE doesnt help ( did it via the entry in the .dtb / .dts ),
> the results are the same. I can confirm the LPI counters are zero or one
> only after the test.....

It's interesting to see that you have a lot of RX packets but few
RX interrupts. This can either be due to mis-configuration of
interrupt flags or RX Watchdog.

1. For interrupt flags you should be using LEVEL triggered IRQ.
2. For RX Watchdog you can try disabling it by adding the
following in your platform wrapper driver (which will be
"dwmac-meson8b.c", at probe):
	"plat_data->force_sf_dma_mode = 1;" and
	"plat_data->riwt_off = 1;"

Thanks,
Jose Miguel Abreu

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
