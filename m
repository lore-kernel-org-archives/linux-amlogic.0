Return-Path: <SRS0=9Y1m=RC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F51C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Feb 2019 11:10:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7780220863
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Feb 2019 11:10:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ugxjytt2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Zqikv4Z2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7780220863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F3uiyASLHJBktMzOoSSWJ6l5akPRZsDKVxI9NtCNaTA=; b=ugxjytt2UpHZSL
	IfkQLxtyGA9mCcU3FmsjuA2RqtgZDKBhyZ9OVh8wjis8bjNHvkMzN+gQ90kEQAwQ4AkxeK61P9OVA
	z7eI7mUnmoySfC8T5z6A3WMdQoLRznz+WmlRk96kK5+cHjQpO14w3USAhnEOI5TBkpapTS7YOX24Y
	Sf0di7VZUD4F8X7IVliH5U+lUrtG4R97HMAJ7JmIaWi+v870bpBGyG1xZOhijSU9h/EJSTPZxuK4z
	JEew46nEbQpJq3Sxz8LKKg8yUm6cEv727zVce8kV3+ggi4cEuotUob9Qew/gPNw9pddtT96PPvnDB
	AB8fuZdeRB1KuhRebmZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyx6n-0002N6-TM; Wed, 27 Feb 2019 11:10:41 +0000
Received: from smtprelay.synopsys.com ([198.182.60.111])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyx6k-0002Lu-Ud
 for linux-amlogic@lists.infradead.org; Wed, 27 Feb 2019 11:10:40 +0000
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com
 [10.13.135.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id CB3E210C13F0;
 Wed, 27 Feb 2019 03:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1551265837; bh=9OtryGMYBTezAhEF2UbOxxUIU504RDMSOTVvFHvtwTI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To:From;
 b=Zqikv4Z2ZWnytrCBesRSceRPjYT97nNiIj6gkD2mWa7rUjuCTcEOSSo9i7vEiLO9j
 WdqpRHOFLKduVB8wVjQuYEkslE0YXsJqbst9aOuCKM20Xky6rwq0CD2QpxmnmIDvLW
 X9WI92z3JT5eSg7c9MUQ4Hil6Z3KcPlhqr0L58gAGPj/Ui6rXx8ac0MzsEWQrtLceB
 b4NX2Qobvhz/xjKmbm5R5asReAYdHqeoXPvgJAwnMh2+w82PEJ9XHjS+6QkrP0MYv7
 6V1ET03owc0lvyL4QIZEFBSrhMlh+TUf6wLCvoJQWkzGorMkONzmYm44upTRaGmCOk
 s0i1COAKbbSrg==
Received: from US01WXQAHTC1.internal.synopsys.com
 (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 066CEA005D;
 Wed, 27 Feb 2019 11:10:23 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 Feb 2019 03:09:16 -0800
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 DE02WEHTCB.internal.synopsys.com (10.225.19.94) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 Feb 2019 12:09:14 +0100
Received: from [10.107.19.176] (10.107.19.176) by
 DE02WEHTCA.internal.synopsys.com (10.225.19.80) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 Feb 2019 12:09:13 +0100
Subject: Re: stmmac / meson8b-dwmac
To: Simon Huelck <simonmail@gmx.de>,
 Sebastian Gottschall <s.gottschall@newmedia-net.de>,
 Jerome Brunet <jbrunet@baylibre.com>,
 "Jose  Abreu" <jose.abreu@synopsys.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
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
 <fa35fb4a-b9d5-9bbb-437d-47e8819d0f27@synopsys.com>
 <244d7c74-e0ca-a9c7-f4b0-3de7bec4024b@gmx.de>
 <1426d8ed40be0927c135aff25dcf989a11326932.camel@baylibre.com>
 <9074d29b-4cc9-87b6-009f-48280a4692c0@gmx.de>
 <d7de65c614ee788152300f6d3799fd537b438496.camel@baylibre.com>
 <8ec64936-c8fa-1f0e-68bf-2ad1d6e8f5d9@gmx.de>
 <f08f2659-dde0-41ec-9233-6b4d5f375ffe@newmedia-net.de>
 <3a040370-e7e5-990e-81dc-8e9bb0ab7761@gmx.de>
From: Jose Abreu <jose.abreu@synopsys.com>
Message-ID: <c21c30e9-e53e-02a5-c367-25898c4614e9@synopsys.com>
Date: Wed, 27 Feb 2019 11:09:12 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <3a040370-e7e5-990e-81dc-8e9bb0ab7761@gmx.de>
Content-Language: en-US
X-Originating-IP: [10.107.19.176]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_031038_989793_ED3F3DF0 
X-CRM114-Status: UNSURE (   9.33  )
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

On 2/24/2019 8:34 PM, Simon Huelck wrote:
> the topic is about ODROID C2 / Amlogic S905X since the start. we have a
> performance regression since 4.14.

As we are not advancing in this topic I suggest you try bisecting
the offending commit.

Thanks,
Jose Miguel Abreu

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
