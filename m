Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEEDC6379F
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Feb 2023 23:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g9rMe6jGmp4Kd+9sYQ9njtba9OICSGC3mL0sxgGADl0=; b=ysLssqGvrcWmUy
	5d56f9NvDU18mLfJfeq4YvgG5BD+NINR0WAgAs1fHeYoQ0wpZycuxt/qwwnoPfbFMp8qn/mkJnGOD
	C+/T+1mpERSAYi0TpMdWeL4MQzQWP6jbkPP+fTSHxLTaLm1r1A9hQDk8ej6r2Pv+nFUmDjUdJ2icp
	JIkHNYtmoBFSH2ObUo66HYWP1kynK7B+ZtX3BrinUkR5aXdGmYhSSPAgKNaOX0oZ7WHQoRbzrrkMh
	zejZywsHFEgQOo08Bh9z93wZt2cUH+7wnAy3St+tOoyk6kGSt+7LP+BSVzfVjUCebOCWAsWtgmdam
	mGkNleUIvGOvHHIec36w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRiYu-00Go1c-3P; Mon, 13 Feb 2023 23:48:44 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRiYq-00Go0W-TZ
	for linux-amlogic@lists.infradead.org; Mon, 13 Feb 2023 23:48:42 +0000
Received: by mail-pj1-x102c.google.com with SMTP id r9-20020a17090a2e8900b00233ba727724so107138pjd.1
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Feb 2023 15:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676332114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A4/KLmeiyzkFaWHLQHMIS71Qo+cLPHUap+RacncgWAU=;
        b=SIy1ijPL6cxdum5Lcgqw4W1EHfIXd043r3kFS1ysk5ncuzH1jYr+7OmLt5uelv5+hO
         945IpKXKTSughA8ITuh/VVjAhFJh7EU1sGJEn5PiztiL7f3GlpNIy8ULolDu8TQkg4B2
         Ux4raNlv1mBJ0xGCnxN3+0q2NM2leX7L0ZKOXQuQPrAVvUGDDIE5kGswxjVF+31jFScm
         hwF8FF032i51W7f85h8liLCWCZXqS1MCAzkMDgy40pD41BfT/q6rwfuswIL8S5uZxSXf
         /bEKg0zqzfiwZz90jyQ/XbryjYTAamSd24rufQQSQ2gysIVjcN9fJi7JI9H20YF3QEpu
         gaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676332114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A4/KLmeiyzkFaWHLQHMIS71Qo+cLPHUap+RacncgWAU=;
        b=yDbB5XGnGTxnwHtPYqOOkOG1UjJvFpexfkEMKYLcx1mFSpXVhLx5lft0ovy2Yt5QMl
         3AOrG9CHGGkiGgAidMRb48Q/yZNox3UaQaf4U5miS2RNu4HmMXqXTG1A9tJesnGviCdA
         Ww3bZEekeIep/gDRn0fGEXu7VsSAAEbhyittmwdVc0XFlhtPiDeoMluCTc67feI3D0xt
         HZY6sGJK1ec2i1UDBOnv8cjMfnZzLTzsKfEkFOld0aw+9cCSSFKt8V4ZG/6pxKXbEZvZ
         Bmg3QGU6SC1TR/B6SkuZKGW8TsNfkneV4YhSIOC/cX5d0GVINxGa8xSwbLGCUWOY5jlp
         B1vg==
X-Gm-Message-State: AO0yUKWrcLQNE9snuUBE6Hybjv5sDqUXNOSfN5QMc2R31nRrsRNy4tKd
	/sXL86OR9egkjZ4bQDIUH2r1puS8Ve9xtO4O4CXBEQ==
X-Google-Smtp-Source: AK7set8NrfoDWyLvgVsdmI12G/+XDZGTYBU4S49iMKrs6M1v5fPz1MotcMn2Hh8ji8y/s1zil+e6QxDtDAnegcw9+xw=
X-Received: by 2002:a17:902:d506:b0:198:99b5:cabf with SMTP id
 b6-20020a170902d50600b0019899b5cabfmr169759plg.25.1676332114545; Mon, 13 Feb
 2023 15:48:34 -0800 (PST)
MIME-Version: 1.0
References: <e7880df5-43ab-d6b5-0ac3-440adfb12808@gmail.com>
In-Reply-To: <e7880df5-43ab-d6b5-0ac3-440adfb12808@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 14 Feb 2023 00:47:58 +0100
Message-ID: <CAPDyKFo75bm2NwCJfGU0QKDEQkROk-Rv5oh_ZE3YgW2AhNhUEg@mail.gmail.com>
Subject: Re: [PATCH 0/2] mmc: add and use devm_mmc_alloc_host
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_154840_979686_B4284AFE 
X-CRM114-Status: UNSURE (   8.79  )
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

On Sat, 4 Feb 2023 at 00:50, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> Add and use a device-managed version of mmc_alloc_host.
>
> Heiner Kallweit (2):
>   mmc: core: add devm_mmc_alloc_host
>   mmc: meson-gx: use devm_mmc_alloc_host
>
>  drivers/mmc/core/host.c         | 26 +++++++++++++++++
>  drivers/mmc/host/meson-gx-mmc.c | 52 +++++++++++----------------------
>  include/linux/mmc/host.h        |  1 +
>  3 files changed, 44 insertions(+), 35 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
