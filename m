Return-Path: <SRS0=yrQE=QS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B58AC169C4
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Feb 2019 13:45:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFF60222A3
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Feb 2019 13:45:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pa2XTvbR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GaLnknH0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFF60222A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KxDdaq9OI/txVP+//07jvQS5FcjBJsAHzi5t17smb1c=; b=pa2XTvbRPh8qKR
	hbDzH9TnEfzrbX/yo7vf/mqbTCiN26PL0Wx3PpMu4c46SzsRaCdTvoIF1p3Zf105GpinURa+sYP9Q
	b6s4I7wUHbNrrQdjpfc9Dy35P/CYOTfg8+Jva14rVHDAL8UcGAcX518i6uLvHupy7ROqb+8mR2bIS
	kp9HI9mzZ7LfsNbd7l1Wwh0uawZpMzXhmqdz5hob4n4knss9CLsZbhZnDUDemfP9RephzsKe3vh7Q
	Pkd9u72fOzBTG6KJy5ges2ty6ZlGbN8RMWobhsne2JHmQx8bM4NIa6rLYfvquCa4rNXVmrKXBl0z6
	qpuzIihZkblk+lsj4i5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtBtS-0006Xt-Kn; Mon, 11 Feb 2019 13:45:06 +0000
Received: from smtprelay2.synopsys.com ([198.182.60.111]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtBtP-0005s9-6Q
 for linux-amlogic@lists.infradead.org; Mon, 11 Feb 2019 13:45:04 +0000
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com
 [10.12.135.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id CBFDE10C0A42;
 Mon, 11 Feb 2019 05:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1549892699; bh=Cm8DHHtWrmdzP3lCFXj0o9Bw1cunCJFDMxoxWuAu4+s=;
 h=Subject:To:CC:References:From:Date:In-Reply-To:From;
 b=GaLnknH0mPBMi8OB7kbkAD3TWHyurFN+vTWt8tVZ5vBz7ZrFi8jmGLr/exvwlCc/6
 Te7zlpPorntFlAcG2CyCazZHG81LwFb3Z2u26w6Na69vupx1/BmNnDksA8hs3++93T
 +HX+IofnLlctK/YbubHwviIhP5uw4304KKe9cpcwUo0cQ1a3E5LC7tXtbMwdIvMq6k
 0tqtkzWWU2T5bRXbhgQ3Fa75smhtyCIuJLeN815Bw36Ky9E6APkexqttFio5lTuXLa
 66uZ7miFbddVLvFj78G+jgVntL2b0yBxLhX5mV3+UZ+AKlw21S1v574L7dcAxA2XJk
 z/4AVGZQHQgPA==
Received: from US01WEHTC2.internal.synopsys.com
 (us01wehtc2.internal.synopsys.com [10.12.239.237])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 4BC59A0090;
 Mon, 11 Feb 2019 13:44:58 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 11 Feb 2019 05:44:58 -0800
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 DE02WEHTCB.internal.synopsys.com (10.225.19.94) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 11 Feb 2019 14:44:55 +0100
Received: from [10.107.19.176] (10.107.19.176) by
 DE02WEHTCA.internal.synopsys.com (10.225.19.80) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 11 Feb 2019 14:44:55 +0100
Subject: Re: stmmac / meson8b-dwmac
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Simon Huelck
 <simonmail@gmx.de>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <CAFBinCDebPOsmrhSXecx48nGWHh7g_OGPbr1Y0M+n_v9Ht91ew@mail.gmail.com>
 <e05b7448-cd95-cdeb-c88d-3a324d5f1ddc@gmx.de>
 <CAFBinCAkXN42piiYsc_Qmuqv0w4dbK86gq10AbZyrB-zKuh9hg@mail.gmail.com>
 <20190206103645.GA2482@ingrassia.epigenesys.com>
 <3001f244-8904-1e89-9595-62a65a7b32ae@gmx.de>
 <CAFBinCB1WUMOmaF6Wmr5HTutrgLOru5CRSnOpUUMMuVzHSa3Gg@mail.gmail.com>
From: Jose Abreu <jose.abreu@synopsys.com>
Message-ID: <330a523a-c1d6-4a99-3287-459096af0330@synopsys.com>
Date: Mon, 11 Feb 2019 13:44:54 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCB1WUMOmaF6Wmr5HTutrgLOru5CRSnOpUUMMuVzHSa3Gg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.107.19.176]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_054503_250960_F4D27137 
X-CRM114-Status: UNSURE (   8.67  )
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

Hello,

On 2/9/2019 1:09 AM, Martin Blumenstingl wrote:
> (it's interesting that the sending direction has 445 retries)

I saw this before and I think it was related with COE. Can you
please disable all offloading and try again?

Anyway, maybe Simon should bissect ? I think since 4.14 there are
not that many commits in stmmac / meson8b-dwmac that can cause
this behavior.

Thanks,
Jose Miguel Abreu

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
