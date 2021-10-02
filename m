Return-Path: <SRS0=UlVA=OW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2FBC433EF
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Oct 2021 08:54:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB3F861AE0
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Oct 2021 08:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB3F861AE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cNQv3xTWf+3nABZaPwirPKq7E1EMKhmVMFzW3a9D+Mo=; b=f/RwaKTEOTsUnz
	k7BApyV0sUrg6BYIGDDLBYL9XzcJlslD49zlS/0wjVCSlCCEHZS/z48qp1q1jMCiEKxmreVZSNWEs
	U9asIE2bQBuGHDVdeTJymeI2Jaank1LhRiNF+lq61Sox5Ex2/Y1CCpRP2tgYBSCV5cxiowx9Cqirf
	ikGm7OhSIgJ3DAHVuxAvv0KMoV7CoOXZQmMKHq6ZymA0qMTXmMlpuvvYnE1Vvmb5jaFb54IXHiKnI
	Q4zbJrKnVxJB0NXK4TyI/BdxP3rhsEUg67joBwt+0Q3XM9XEwmkCrGnoFtFF2QShyYP8/pPfDHOeS
	PaHR+g1UYMgop97J54nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWamz-001xiw-PY; Sat, 02 Oct 2021 08:54:37 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWamw-001xiE-TF; Sat, 02 Oct 2021 08:54:36 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:4:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4HM14m6WnJzQk4Q;
 Sat,  2 Oct 2021 10:54:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:message-id:date:date:subject:subject
 :from:from:received; s=mail20150812; t=1633164869; bh=F/bUp6LuQq
 hrVvLmFvLTVdfVmhxJVLNrN7TWNzLeElE=; b=W9vU7pe/9MXnmyS1XZ8wyCsK5Z
 Sq3PXtWwxQxO/yF7+7w+OHvTq1J4IZyx1U3h12hTYEpF+qwfON0+MRnr8ga9rs+v
 XfwTwp60iWnrmRQPJrNNVpXeA/f7u5xhjVwHbkjCNrHX/PRi2UjQjnr5CMyp03kE
 49s2tnNrVRlXlfAzPbx+kIwo8F1i6SPRdG/iCKenQKWcaBoVVzKFqawEvsVcQ670
 E6vD780SxMQi0ylzjHwZAPgehPsDXeLsOTf8D3EVHZvrkHxr9tdDf/thafpCFOR2
 +TlTcFl05a3zv9gpa8v6TDpCzzroLi8RwmXnK5SshjEbYEtZXKG6kXdPt9Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1633164870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UkiZmpWhMlojqJXU2ywGtm9SmvU5lD3peaacs9hyFmU=;
 b=uihyxFb8rGu76MyIRG6TP4zzXwt+EWJHkrMaKhMid2CSf0iEYudeiuF65jkJsKW7f0+UPD
 9bXmvvYKMfcdEqt6vNW5C47nqtv5OvdnFbuUdBGFRNbarg3vEWfm9gxaTuPStIQxtyct8v
 xUZyTrj0JzYwwPVQO/0DyvwUAXPsTE1w9Gk9gO2zOw7NrJR/9zYpvkVCSUvJrxTpiW0IDr
 qR3sODxJXf2bN5qZxA9mL8wNQH4PuwfnlZyRBr6QQ8+otHvoJWGfxw4ATBERKhiewo7yp9
 +B1WXky0mSsUDsNBpM3ve/bxSJe2j5RYLydXupQLsyY+3U0wZ9jDfh8QOQjq9Q==
X-Virus-Scanned: amavisd-new at heinlein-support.de
From: Alexander Stein <alexander.stein@mailbox.org>
To: Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/1] arm64: dts: amlogic: Assign a fixed index to mmc
 devices
Date: Sat, 02 Oct 2021 10:54:25 +0200
Message-ID: <7392649.txi2qhsmnO@natsu>
In-Reply-To: <e115009e-d93e-4e05-0ff0-c754fd867ae0@baylibre.com>
References: <20210127230852.66686-1-alexander.stein@mailbox.org>
 <3603832.OnnjH37t2F@natsu>
 <e115009e-d93e-4e05-0ff0-c754fd867ae0@baylibre.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 6D7B226A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211002_015435_164036_781DA9AC 
X-CRM114-Status: UNSURE (   6.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Neil,

Am Samstag, 2. Oktober 2021, 10:49:46 CEST schrieb Neil Armstrong:
> Look at
> https://github.com/torvalds/linux/blame/53d5fc89d66a778577295020dc57bb3ccec
> 84354/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi#L21
> 
> The commit
> https://github.com/torvalds/linux/commit/ab547c4fb39fe145b39e3013633258a5ff
> 475d88 is upstream since v5.13-rc1

Ah, the SHA1 changed. Dunno why I didn't see it in mainline though.
Thanks for the update and sorry for the noise.

Best regards,
Alexander




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
