Return-Path: <SRS0=i5j0=QZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8D5C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Feb 2019 16:43:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AADEA214DA
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Feb 2019 16:43:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lYktdY5G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Hk53TTL4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AADEA214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SwMG1LXNJBtRcRVYNQKw08ku7/wwTYFikd3quiPbJOk=; b=lYktdY5GLhsR/Y
	Q7EefWgVpa6DhlTk6RG7+Md5XFu8Y3/TAmvnplpOYDMmIO6W8P+KCeG587neMrldii1xCph+gEz29
	UxmNcbGDYErEwl70aabtA9uhpgY2qvWHL6XdB6IuWkSI1c1zYP27F/mebXByQqugU/H8O6RyDHIwF
	UT3lBV1CV1UBGkvjTWPmN0qN6PzO+ByVVWblr2NSQjl2/UEtToBIrBECf5FaSDxWVrSHuk57Pfxgo
	ux9BKVvtUKwoCqh5brPrTxfZSEIKeBlcR/DNKglU1WVUPBQp1wWR6WNzXcty6oZ96bQXfzENxBxOB
	rIHJ2xXp+geXomlx8dmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvm0w-0003VO-Rq; Mon, 18 Feb 2019 16:43:30 +0000
Received: from smtprelay2.synopsys.com ([198.182.60.111]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvm0u-0003Un-6b
 for linux-amlogic@lists.infradead.org; Mon, 18 Feb 2019 16:43:29 +0000
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com
 [10.13.135.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id 9697110C172D;
 Mon, 18 Feb 2019 08:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1550508207; bh=13xHaXt0Edjogxov6YVf8fb5RgQVYhFgNYBy3xAHDsM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To:From;
 b=Hk53TTL4vWxNWsD5x/+x0c2u6GFQD1SfNiWk72IdiskYkQYzfHQNzYoOEIAIu1+B2
 dzq7zzEXzs08uWTlVmbKOrTnC/kDlXCq4ud4l9Qjc71PymwGHJLJavYjcdN0f7ElQX
 dqGCbGOzbRdJjCE2rc2DMf7uFK9RfHVQ+4MDEQ7usvnBtoOsgDjNwiy2hHGeN/XKlD
 YRKorrNtZ5YRlmlBOHLGOp0bUqzeDylLHUeQ7qv6W6x/hsNh/46cXm5eHtE1kLSFOq
 LmGeg8y8UMJzV4yikBjwChwLkO6n26wliFxxHQK09/sdtSlhdpa+9/j/3tlrZe4rmC
 GZDEYqugcgdew==
Received: from US01WXQAHTC1.internal.synopsys.com
 (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 29675A005A;
 Mon, 18 Feb 2019 16:43:27 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 18 Feb 2019 08:43:26 -0800
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 DE02WEHTCB.internal.synopsys.com (10.225.19.94) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 18 Feb 2019 17:43:25 +0100
Received: from [10.107.19.176] (10.107.19.176) by
 DE02WEHTCA.internal.synopsys.com (10.225.19.80) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 18 Feb 2019 17:43:24 +0100
Subject: Re: stmmac / meson8b-dwmac
To: Simon Huelck <simonmail@gmx.de>, Jose Abreu <jose.abreu@synopsys.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <e05b7448-cd95-cdeb-c88d-3a324d5f1ddc@gmx.de>
 <CAFBinCAkXN42piiYsc_Qmuqv0w4dbK86gq10AbZyrB-zKuh9hg@mail.gmail.com>
 <20190206103645.GA2482@ingrassia.epigenesys.com>
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
From: Jose Abreu <jose.abreu@synopsys.com>
Message-ID: <e1d75e7f-1747-d0ce-0ee7-4fa688b90d13@synopsys.com>
Date: Mon, 18 Feb 2019 16:43:23 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <45e73e8c-a0fb-6f8f-8dc6-3aa2103fdda3@gmx.de>
Content-Language: en-US
X-Originating-IP: [10.107.19.176]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_084328_243594_93802C85 
X-CRM114-Status: UNSURE (   9.39  )
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

On 2/18/2019 4:40 PM, Simon Huelck wrote:
> Hi,
> 
> EEE is enabled for odroid - c2 and should be working in 5.0-rc7 afaik ?

Oops, I was seeing in the wrong version, sorry.

And did you test without that patch ?

Thanks,
Jose Miguel Abreu

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
