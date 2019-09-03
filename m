Return-Path: <SRS0=0xNA=W6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50CBC3A5A2
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 19:00:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95B8321897
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 19:00:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VPI/gOQP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="l9nH8yA8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95B8321897
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AfXiN2jut0FgO5BMC4X7QyuEeGaiSHjLBfKyP/MB+qg=; b=VPI/gOQP+Hxm8E
	0ANMl8SDlKrnj/U1zL+j5P7m1em4jdYovsDB/CGIv97r1We/kVLQZa9Ux2zVS/j0YWMaX5aFxpiMc
	YiaU8uErZI9NCfj1IqRE3RDK/LHZGt4OrrxQe0oYR0e1sBrjjkG+nTRnTQIttF+l/7Do88STO11GO
	+yBL2pMApvDgLJ4qwcoaV19v247+4GFcGaj1Sgjvu/TTyDHw3KVuuuEFJRa/hkS3ifIC9vlIirv0B
	Iv/O6qZRS0WjCgA/H02D2KNfEHoU24tV1M0COtQpb1aCAbvfGdrRZQR8O0eWxwNSq9oTlJQIm4ETb
	kLyU6YFsNXOU9G4o8iYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5E2t-0000qC-L9; Tue, 03 Sep 2019 19:00:51 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5E2M-0000NF-AU; Tue, 03 Sep 2019 19:00:21 +0000
Received: by mail-ot1-x341.google.com with SMTP id 67so6417650oto.3;
 Tue, 03 Sep 2019 12:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vf/VvldevLv/HCFkjZrV94cfSMaqLzordyoxKpG1uYw=;
 b=l9nH8yA8dk2cWypmwNTEl29wItA0r60ykvssWEIu6OfsaVT2LG924XNrdoQDJaVKKU
 KhPae1R/bxhgZCuawZ3GLUgDARpEyLUCJLwt+bbgA+t3TCw/v/vYXhnDEaNCyyUAh6uu
 05lpyL573U5gYnRbeV1fiUF4xYkpLr1e4fQy1H85nmpLdQ5zsmZseMt9ue+FH9rGrXYD
 KzfQy5vzo0LDOdRHOVGJDXQhSpqA8N+tL6uEpQBo0Stkpdu0V/+5gw8x8IQwYK+x/700
 UhaY89UU7vsCnJd0AwtNFsC/YOU6IWAMJv/bI4vcFwVsNKlZaX5Ktm0I+xjVRWUOpSvw
 SfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vf/VvldevLv/HCFkjZrV94cfSMaqLzordyoxKpG1uYw=;
 b=k+8tP3AFbEDudGyb13iJGADlRdxPbZ0ICf0C6YGRbtLZ5VbEVetLi3Dgvf5ysmkXKN
 LaCamN29Jq+f68zj/M5dwvZ2umt2fe2F4Qkr3x+t0SG41oXv5uj596fGwIWJD0Pr/cTm
 J29bOwi5KmzKRs0zvD6+3SNzcqWMiweZ6Hc/L3lt2oE5ugHm+UOghXr3Ml3MA6nBITjK
 4YIiWCUiQD8fBJ6vOvdeJBGI7Q7mMvw3z6QN4/aqhdF9PRANrZwP6jGSHS8gL+yRt2jj
 xlrAMhVyz/0WIfkXFHoSs8ev+dqMrsPuwFWcU9YGsWZiPjsy5FvUVtGrkeU7woh38f/R
 HQMQ==
X-Gm-Message-State: APjAAAUzOnwm7gRyAHNYSpabcA7UB97QQVM2b2bybEfI260+bLnjg6+S
 RmtNsT3J7vLt31nACiVXaFHI/psemWIa0zSiSP0=
X-Google-Smtp-Source: APXvYqybrQKStl3+FVCJwwcMnm906TDSMh+2UBslvDCPsH/wUJ0nK8jlZLTIL9bXUyNxcp7IBfZAAKplrBI9qBuchqs=
X-Received: by 2002:a9d:6c0e:: with SMTP id f14mr18894833otq.6.1567537217247; 
 Tue, 03 Sep 2019 12:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190902085821.1263-1-linux.amoon@gmail.com>
 <20190902085821.1263-4-linux.amoon@gmail.com>
In-Reply-To: <20190902085821.1263-4-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 3 Sep 2019 21:00:06 +0200
Message-ID: <CAFBinCCkdaCQim4EZtpoo1J0FyCEUNP8djXnF1dK=2cpX5Vizw@mail.gmail.com>
Subject: Re: [PATCHv2-next 3/3] arm64: dts: meson: odroid-c2: Add missing
 regulator linked to HDMI supply
To: Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_120018_414966_D36B3F22 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Sep 2, 2019 at 10:58 AM Anand Moon <linux.amoon@gmail.com> wrote:
>
> As per schematics HDMI_P5V0 is supplied by P5V0 so add missing link.
>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
