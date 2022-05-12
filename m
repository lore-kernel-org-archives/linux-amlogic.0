Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EECC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 May 2022 10:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9jaQ80DzcywgoWdI2YRwPAQMVNRm260biXMVlaL5Wn0=; b=IBbW6sl/QTXTzz
	gPt0A7UUt9uyLaJ1REfecPZnFLRzK0r9sWp97Pw9FDUUzRupNPiY0Zyt4PtHBMe/qM3y30d+ybcWm
	BpZt408jdH0yWfzfhEMI2RuI04kRKJodkOs6msMPAbj/glzc//QS4PiMJWRgZEg14L1T5Amjv7YuL
	91GYH5Bsb7cWiDV5vdp6tx6NVT0t8VumwZ6ZqHl55TtqK5XNrq787BVEUtpCdKTjw63kJ57ZiSGQd
	ySPtkltVcwYm0Ddma8ye8NfAgDX0FOq6RBfISSp3bA3pVx4wC0Gl61LnzC87zXjuvzVferO1z6BtG
	ecVPWe8hCAIaQk6J1K4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np6Sm-00BSaz-2s; Thu, 12 May 2022 10:54:32 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np6SP-00BSTN-00; Thu, 12 May 2022 10:54:10 +0000
Received: by mail-ej1-x635.google.com with SMTP id kq17so9425582ejb.4;
 Thu, 12 May 2022 03:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=saIXIgLCPDIyYjz9lRSB2RkGl170e531NzygSMa6KRo=;
 b=ohw4R9Eg0c2ItbfYTsoSCNIzcYvrRzOml2pKWEQaAB4ocJSt0I8jBEz2xw6tSOU2CG
 hh3DP8+mQs0TdYnI7eErVcX66oWFzSAVgPT3ekolBdecacsvIww7msvYLh2K7F4kyEE3
 vTqzPB6lX4MXk7bbBc/bz6b1YPiFKsgk+4S//6wkJBKY1GAuBesTOVDTgH2QdK0Vz25w
 ASPYe45vQr05a1VolDYvZf8IRUflA5UZ3aJRR2SiPQgUHA4hfgT8wTEDlBtZa+hjgdR3
 QxYNc5LhO4w8r2e+XKplRSfLt4Is+jWJuEd7ZpnnjpQM1a0P2COUml31sM/Guy16eFjR
 kNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=saIXIgLCPDIyYjz9lRSB2RkGl170e531NzygSMa6KRo=;
 b=BMHCr9vinhGEBWMVrCSePAnzgkSmtOs+IA7FMUNaXc/3ulG6oBCsxgWUQFRdzoQU4I
 8gyn5yaBTGnU825+ATvspo411OUkgnCKl0JhUYh5h8oqfNu687XcP3xOsaxLPAoDEsyK
 bw84ybq86z9D/ZttZSE0izM/Bvv/O/kfQT9trd9+/KebQVM+DgmtxPgaUf4ixbRAtoEd
 ddg/Dbqj+kp8OiA20YRokwOFw8DUHy+ttqh+Ljw57QrUnX/umr/13eNH+xb0QBY7kMSO
 N9jqLv2tppBrxXGiTp+fHjwINDlhfCK7t17zLXfeej+GOURUFp/uY9dijHcjOXT4yglf
 xgwg==
X-Gm-Message-State: AOAM533lh24HyXFS42zXdE4vmEJ/1lrDhmhmVuZdJYipgqfR7JpxViuu
 uMb3/UkPua/Ml1g+DKLiXxAXisdUr5jca0mUfl4=
X-Google-Smtp-Source: ABdhPJx1lLArqdjQJqGvhsRJUpI4KPvwCeQobzGn4twNX1r2i4axTm2gv4b7doAu7EwTllKGCeOASI58WuVd4uwVUgE=
X-Received: by 2002:a17:907:1b19:b0:6f0:1022:1430 with SMTP id
 mp25-20020a1709071b1900b006f010221430mr30146117ejc.13.1652352845214; Thu, 12
 May 2022 03:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220506232850.220582-1-nobuhiro1.iwamatsu@toshiba.co.jp>
In-Reply-To: <20220506232850.220582-1-nobuhiro1.iwamatsu@toshiba.co.jp>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 12 May 2022 12:53:54 +0200
Message-ID: <CAFBinCDdBzHNzP2WiFke3E-ReTbNO34Tm-8kSV7QO_y8s_VjQQ@mail.gmail.com>
Subject: Re: [PATCH] rtc: rtc-meson: Fix email address in MODULE_AUTHOR
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Ben Dooks <ben.dooks@codethink.co.uk>, linux-rtc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_035409_090837_9A5D1356 
X-CRM114-Status: UNSURE (   8.44  )
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

On Sat, May 7, 2022 at 1:29 AM Nobuhiro Iwamatsu <iwamatsu@nigauri.org> wrote:
>
> From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
>
> Ben Dooks's email address is <ben.dooks@codethink.co.uk>.
> Fix Ben Dooks's email address in MODULE_AUTHOR.
>
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
