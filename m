Return-Path: <SRS0=VwQk=ZW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F6CC432C0
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 13:45:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 751352075A
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 13:45:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kCRBYEbS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="i3Z02aWO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 751352075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3UzQPA0xeagWHjSSg6vYfbVZmhUmqS6sfV6raFbJFco=; b=kCRBYEbSWv3Ny0
	jAuNIf4l13X/i6KEXRwgd5pGa13XiVsGsv7wszsdyyJiAwjzWXA4QsgC5V1eTita5jSgvmIy+Tmcy
	MF8PNVbGJpNWeJu5f4HTdle8gH5nhPLx2TLXTcSotUxxUuOYm0wt/9Y2S54/V+ieTc/MbBsbi3F8m
	uyRiWDq+ZgZ3+bnIagKV26+9dCQ0v74tZPuuLvP+jy63Jtd9wgW4MpwYT4RcSYSVs38FagUl224XM
	WS7BKs/WpJhJclGMMk41IHGz6S2laLa+6Lf6obLHCVPdmisQO0IVqdSDrt9cys7qKxO6MDUZgzb6b
	wC0Hd/A0dUw28gc0kYxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ib347-00024S-Bt; Sat, 30 Nov 2019 13:45:39 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ib344-00023l-Rk
 for linux-amlogic@lists.infradead.org; Sat, 30 Nov 2019 13:45:38 +0000
Received: by mail-ot1-x343.google.com with SMTP id m15so27118682otq.7
 for <linux-amlogic@lists.infradead.org>; Sat, 30 Nov 2019 05:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wTyZEPvpo0PLpOTd5AKDM3P2wmdibZMqRSO63AHR/58=;
 b=i3Z02aWOSfMH+lmJzw3TTt09QTqNIuFbl6pSzVOoLoOV48NLZGjDf43kbc6gxsaNYA
 G20Q9JyYJQZhw7FCC7nXsyqJtMHoQqthGgUOYVKyYsyTN/fBnU6Mvb+o+GxMN+ISbUn9
 1Tp9MWe1NUk66rDkdCia0J9kmvh+AMnxcfu6wmv5AD1mSkK3xBiBxh7PpQ18YnWJ9sl3
 XQOHqHFZZWKDiWwDMwyuhcdOW2lTVncacHonGVTV3XCmJHHF1QwESvkbtVzAgwjzR+j4
 q/EE4JAHKP6ySmQo+WsXLjznS8oIqoaMmxpH6Wex7+06XyHdwYvkTuLMLDLOy7mmVj2P
 yalw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wTyZEPvpo0PLpOTd5AKDM3P2wmdibZMqRSO63AHR/58=;
 b=CpISdwuJ8PvZFe5c9TWcjL94vM2tUmjo0EqHGnbJw1UGBk6qQdAWyYzLKq0eByGrpz
 16pHLhJ+BXxBpYX2H2wVKVtajAnkZ8GFrq0jiNKLmM2G+E16v9G0ZKGg3zCRyubNFurs
 A1iPgiOums+VRKuZxrI2J6EN5TYpfJgqmnhe2DoETzYoHaSQIMdDOAQTC1M1ykjQVhKP
 dHnfdfaTiRYZubhZV/2W3EyJm3DRtGwenybOUYCcSrT0L/+umxGw7/NApdD4yEPO7/5s
 d6QO68IY/UJMCh9XKeI1sQhQ1nDJYDShNY1y9Xe0lYrtpre4jvsLrtQuBKYLC1Mkh+0Z
 jdAQ==
X-Gm-Message-State: APjAAAW6kLOyX+UpTUUvML8A0ZYI77eihKvig18xUjEmRjbv48i1cC2x
 WZPXyidsUixgTNS1CBVBE5yIrzid8020YPNOP68=
X-Google-Smtp-Source: APXvYqyCX4BuLvR+840AH+NJOOsG8+inx0w8y9R42Xu8hiZugnd05R0p06CIl7qpGgmUt0Bv+tMcEqHrkicvsv/CULM=
X-Received: by 2002:a9d:6a4c:: with SMTP id h12mr12131649otn.81.1575121533758; 
 Sat, 30 Nov 2019 05:45:33 -0800 (PST)
MIME-Version: 1.0
References: <20191130115824.31778-1-mohammad.rasim96@gmail.com>
 <20191130115824.31778-2-mohammad.rasim96@gmail.com>
In-Reply-To: <20191130115824.31778-2-mohammad.rasim96@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 30 Nov 2019 14:45:22 +0100
Message-ID: <CAFBinCCg5GdHprEKfXU1LBtgQi2G7P30=bmLh8Acrn82vYGfeg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: Add vendor prefix for Videostrong
To: Mohammad Rasim <mohammad.rasim96@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191130_054536_922995_AA174704 
X-CRM114-Status: UNSURE (   6.47  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Mohammad,

On Sat, Nov 30, 2019 at 12:58 PM Mohammad Rasim
<mohammad.rasim96@gmail.com> wrote:
>
> Videostrong Technology Co., Ltd., A manufacturer of Android Players & STB
> (Android with DVB Hybrid box & DVB-T2/S2/C/ISDB-T/DTMB-TH/ATSC )as well as
the space after ATSC should be after the ")"

> HD media players.
>
> Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
with above typo fixed:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
