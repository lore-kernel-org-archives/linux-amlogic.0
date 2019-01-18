Return-Path: <SRS0=part=P2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981A2C4160E
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 21:57:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 680742087E
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 21:57:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cvsh4CA+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="TaxqauaZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 680742087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ggjkzloBdHYfaH4i7Xqv/XfNxIXuYjlqYd1EEF7Q0Hs=; b=Cvsh4CA+D1U6l+
	wiDRWeyLwukYiKqGAmen05PTFucxmsRJ51oM3hvh82OceY66JPtzqTtwrWGNhRRaU7GTlzLaepA13
	IeM2Grf/q0FpsQaqj+k/RvR6l4ZSyINyVNWDfFYDLrAN9rGHobv7BQhu9V7+7TRYh/m12zdcDvdK2
	RY7mOptAd47vt4rA1x1J3XJspIaRebJYZL+lczTy6Z97xzYXevc6OUe725ZCgKVAKKAkBUaZCHQsV
	Uf/QOLFhxJHGrCKOC7jFCsVGf2XVly6EKw9KmLbqypJI2MscxAWi/iEDJRDKfULlY3f+1L2UsFIt2
	Boy8E/NgqOx/3qak417w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkc8J-0006X5-13; Fri, 18 Jan 2019 21:56:59 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkc8D-0006Lh-3I
 for linux-amlogic@lists.infradead.org; Fri, 18 Jan 2019 21:56:56 +0000
Received: by mail-ot1-x343.google.com with SMTP id t5so10706615otk.1
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Jan 2019 13:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mELmeoo6i0AmfR+AUOVDwxlIWFbCQN4kYA4tF5V65YA=;
 b=TaxqauaZwUY0qbh6EyRPz+THNbqZavywIh4F7TwBaS6u9AP5q/61dTxeibsdnfEFOl
 Ur5IMi87M0liwhnIGTQk2fZrtPHy/n8kH5byLvLwiArKndHBy2+kmpl4xYw/0fVkmE6Y
 Qt02ftSJotO8Wsm4mkSO4QSLmOCGs8Wh6PxI5mjFPrw8cgwbKNyTx7t1uhzmLczQLVUM
 UugNLVQuEBd+nm/P+8FIUuSXO+EjCjNojmahaDWNjw3bl8sqGjL5KuuL4TSVmAavPtmr
 BQgNt5SaD0pPy9CLC42zcr07TmREmN+3dpqOSdkyBCU5DgLiWmAgqrYaV59b7Z1N7id2
 BRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mELmeoo6i0AmfR+AUOVDwxlIWFbCQN4kYA4tF5V65YA=;
 b=Nvh5S4En03wKaBPpYYYpR3xLYjHmId/boyOyKNV+MsihjhfgXlyv/Ea53P3F2pBOg5
 boPS2rWwbv5+M0qsHA79Nar/uuupLoe621pDn99qJygtw4Ls6IBDSiVuiOBcJiWYoY77
 3+pyfRbN4yTn/PUfvoXyLANs0SHSsATqO0sgw7CGsMIPKCmh52KjP/TWfXKGotqotR3O
 pekIHKDRB3y5QUi5PLx4WNj1JifEKd3BTzKzuvIBid9qhU6Szd6IdvoIsOgUDHsfzIyH
 LsLbr9nyByw/2eEKCgxqrJdqmahOVSMfUCjf+papdbLzpWk5zOaVYcHGVFXn3RWWE5EZ
 LHDg==
X-Gm-Message-State: AJcUukcTVaIBs8T7fggc8pKnNNHh02q71FEffzCBpq0lc2kEvTbIWCl+
 KEO5OxlNn6srYUA6jHWzbxeGCk459//9IMQNYmAedIUF
X-Google-Smtp-Source: ALg8bN5Q0JRI41u5cxmCRdQ6+Dg2kGNuhfKiudy4uooDptDAzy3Yr117FXGDLtC3VGhcrT7c1pv3S7xsdOV27JzuEoU=
X-Received: by 2002:a05:6830:2010:: with SMTP id
 e16mr12322539otp.86.1547848611415; 
 Fri, 18 Jan 2019 13:56:51 -0800 (PST)
MIME-Version: 1.0
References: <20190118103423.15075-1-jbrunet@baylibre.com>
 <20190118103423.15075-2-jbrunet@baylibre.com>
In-Reply-To: <20190118103423.15075-2-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 18 Jan 2019 22:56:40 +0100
Message-ID: <CAFBinCDzvQ6BhkQmCt+OJs7L+xydq7QVy5QB6MYBFaAc3fzpmg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: amlogic: add new compatible devices
 to clk_measure
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_135653_198177_4B0F0603 
X-CRM114-Status: UNSURE (   6.67  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Jan 18, 2019 at 11:34 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Add the axg and g12a SoC family compatible to the clock measure bindings
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

this is certainly going to make it easier to fix potential issues with
the clock controller drivers!


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
