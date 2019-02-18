Return-Path: <SRS0=i5j0=QZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16189C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Feb 2019 08:45:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB4702084D
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Feb 2019 08:45:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UMG8p5hn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QvlCKASR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB4702084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=izGq38UG9YL90Ng1EnkX+MYmFtPjrF8mO+QYawu6xeo=; b=UMG8p5hnVn1WxB
	5arC7PWhYhmQRuL7cxYQj4t4JjBWgWye6D2d2i5dRZIBW3wO+481eA5B8zh3BPhd1hyh1QcKhimle
	fdJGwZ133gwA3HxsM6fbj7Ua4OZl0rewvEGz8r8oJDId9IdGRqF98GCn8sP7v5BPDnqr6axe9+1ai
	2xFyL/CYs6Kw3cgrjd2FAyJR9jur0YZHRWjavo6iPbxHlyjWYuYVpkNFgm84qWh/UkZea7cYA1YY2
	sFN4BU1H6nuE467pc4TBwJMzehyeeFVBqvR8wnJQmu9cQFN4eFzTm6xnEOK+GyKd/pR+B2DdywRNd
	eg/5bOtPrGaT9iZHpfkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gveY9-0005St-MW; Mon, 18 Feb 2019 08:45:17 +0000
Received: from us01smtprelay-2.synopsys.com ([198.182.47.9]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gveY3-0004j3-TU
 for linux-amlogic@lists.infradead.org; Mon, 18 Feb 2019 08:45:15 +0000
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com
 [10.12.135.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id 4AC5F24E000A;
 Mon, 18 Feb 2019 00:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1550479511; bh=UY+fLH1LUfv/h873LF+WGU+mOdE1GRA6H/eL10n7l4w=;
 h=Subject:From:To:CC:References:Date:In-Reply-To:From;
 b=QvlCKASRYuQytfuDolChY0dNiwMIAdesQyzF+iJmFBA9bmAsvEoeRxPyCXkMzwO+o
 0V9IWLwZMh4Ek/mTH661ESHU9XH0Poc0pY22+bItY4BzLlvR+r+9kzVnkAZ6hz8UE1
 Wic4/j7/Dl405n+XgsO0M7MSZttXpYnFvV5Okz1XvhOg6m37oZRoODJgPAmQ3G9r+e
 APLc6rNTOH8lneqpcbugjPgvXtpnk1byi7SHm/BE9v855MpFQUxhbAy1ZpjlNm7bAz
 Fzcz1SGRPyDT3/ktLj7Qgz/+lOdf6vm+apGV/Hvm1Xmna8pf4gMZl6iBK3QSQYiqDi
 IQCczPV8fFgig==
Received: from US01WXQAHTC1.internal.synopsys.com
 (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 00298A0096;
 Mon, 18 Feb 2019 08:45:08 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 18 Feb 2019 00:45:08 -0800
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 DE02WEHTCB.internal.synopsys.com (10.225.19.94) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 18 Feb 2019 09:45:06 +0100
Received: from [10.107.19.176] (10.107.19.176) by
 DE02WEHTCA.internal.synopsys.com (10.225.19.80) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 18 Feb 2019 09:45:06 +0100
Subject: Re: stmmac / meson8b-dwmac
From: Jose Abreu <jose.abreu@synopsys.com>
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
 <2abbf79a-cdff-b6a7-42de-79ea2c6ab367@synopsys.com>
Message-ID: <c80c1e5b-fed9-25ce-eb1b-258ac0135ce7@synopsys.com>
Date: Mon, 18 Feb 2019 08:45:05 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <2abbf79a-cdff-b6a7-42de-79ea2c6ab367@synopsys.com>
Content-Language: en-US
X-Originating-IP: [10.107.19.176]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_004512_423701_8D12E15D 
X-CRM114-Status: UNSURE (   9.16  )
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

On 2/18/2019 8:42 AM, Jose Abreu wrote:
> On 2/17/2019 2:48 PM, Martin Blumenstingl wrote:
>> Jose, is my command for disabling offloading correct?
> 
> Yes, I think so. What about NIC statistics and logs ? ("ethtool
> -S eth0", "dmesg | grep -i stmmac")

And, "ifconfig eth0" after running the test.

> 
> Thanks,
> Jose Miguel Abreu
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
