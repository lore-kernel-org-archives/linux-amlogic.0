Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1DEEE49BC
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2024 15:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1kqzCDCIvARomOM78+qZZOnohWpN46pqbVqr0vhM0O0=; b=0mvf4NDXE1g5Ig
	kPx/DMQbtTQRS1dNLKeglheWEv8hQKR1LmJcuYqc05Am34r1HRFHmXW+nM1kBOTFG8AReqO4COc6n
	0OwfyL9weD8DNasxDsl1NHIhAjd9iMqkJHTtqXJHG5fFWrFxX5ilQl/TczpHEqiCT3b+aJEkRfnuk
	d684FQ4qdoos6QQLfGV0ZZfvBOxuoRqFmjDEImjVI1IDtd0DKTpIWyyHrtqLa6n0uGWvzGJ7M8j1l
	Or7h+tjm0xu9Bn1IeICahaC1P22I7jInDu3JZczbGs4SD/ElJW7Ma4W9hNRpVyejT/leDD4DRPukt
	F5ddmq5+RadyGkX6uiQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soP9z-0000000A7Hg-2E9d;
	Wed, 11 Sep 2024 15:21:35 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soOlR-0000000A27B-21bw
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Sep 2024 14:56:15 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42cb6f3a5bcso3621235e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Sep 2024 07:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726066571; x=1726671371; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5y6hlVFNZ9ghFAZ/dOgsxCt/q59tWWK+iBtItb690SU=;
        b=fNyB2QCJS/hE81Ki5Mkm4SweKFBv1yHmP48qX/UnD1QVTv+vGlls7r5Q6NGK1e6ri/
         D+m6k8Gk7HQDvrwFM6zFpChvrFDjTNT4WjZjKsjKB8y1KOo2vwMrFtPO4nhmO38Ku9sD
         iTN8d7AqJNNjVIhCaht9RrOLQU/VrgJsXy+a5DwV8Lr5Ku62BNRNUGB2Xi/XK10Hh/mb
         9e2WA7L/updGoVkFuLQ0766tVvVolRr0q4/ueZkzGhDSvfwHQVX1kiPaJDv0T2M8cmJF
         s9wEMVov7hNOaKtrD4lnLBgu/ykPUkpKzm6/GYRKxBDtVeS/TPmbriDBDFU0jJS9q4pf
         DzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726066571; x=1726671371;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5y6hlVFNZ9ghFAZ/dOgsxCt/q59tWWK+iBtItb690SU=;
        b=eYGi2XyGH0vIn2wht+KV91eqeBQdXsv3Mnr0CnOc7FqGUV+b6SYduKWn1EFznT8dP8
         IMujy1/ABQeNKEN/8qb1FuWFsc6KqjZC6TypOeMAB13My9njdNUG26x9zewfNits9KBz
         yHraCjklAhCVgx5nRp05GE3TTt0G0LZDvisfXBuo8qKoMMuT6iihf9kfph4L9FkVd44N
         HMFV1rZFk0fmEY0qlhqH5PM/gsmgS3CiF7//TkYQ9+iCrjYGQlVTf/5diwBt8iXXlNYI
         nzvb9t4RNK3wcCClrvmXJAXnhqyF+XXCoqxWQSCyZdzh2r9VfHtaButSJdUMTlSd3gFy
         BJug==
X-Forwarded-Encrypted: i=1; AJvYcCU4gD+MNIciJHcAQLbWsgG49WRCrHIzCYndfhtOjqMLH/++2J/gXjZhqHsk9GXPO2A9hmKeNc+Axy9UsnQw@lists.infradead.org
X-Gm-Message-State: AOJu0YwZoah23dJhiG6Hru0jStQrcJnQCPcnF6D8cizMNboCoOZyj8QW
	E1UKckx0tJtFx8rtZDA1o8ElcSLxocQWsjqPulPa5J5v91J6WuXXVFL6yV0XvOw=
X-Google-Smtp-Source: AGHT+IGXbGreRimd0uqLh23FCjFV/446HYpWf16uni3SRkxonRMyp0eon2FdyilvNaU/tKo5u9ETgQ==
X-Received: by 2002:a05:600c:3b9a:b0:42c:aef3:4388 with SMTP id 5b1f17b1804b1-42caef34492mr123874855e9.6.1726066570926;
        Wed, 11 Sep 2024 07:56:10 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:7388:2adc:a5d5:ff63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb77afd5asm105511255e9.17.2024.09.11.07.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 07:56:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Jaroslav Kysela <perex@perex.cz>,  "Takashi Iwai" <tiwai@suse.com>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  "Kevin Hilman"
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  <alsa-devel@alsa-project.org>,
  <linux-sound@vger.kernel.org>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-amlogic@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <kernel@sberdevices.ru>,  <oxffffaa@gmail.com>,  <Stable@vger.kernel.org>
Subject: Re: [PATCH v1] ASoC: meson: axg-card: fix 'use-after-free'
In-Reply-To: <20240911142425.598631-1-avkrasnov@salutedevices.com> (Arseniy
	Krasnov's message of "Wed, 11 Sep 2024 17:24:25 +0300")
References: <20240911142425.598631-1-avkrasnov@salutedevices.com>
Date: Wed, 11 Sep 2024 16:56:09 +0200
Message-ID: <1jo74uqlx2.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_075613_670630_5B43F08A 
X-CRM114-Status: UNSURE (   7.63  )
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

On Wed 11 Sep 2024 at 17:24, Arseniy Krasnov <avkrasnov@salutedevices.com> wrote:

> Buffer 'card->dai_link' is reallocated in 'meson_card_reallocate_links()',
> so move 'pad' pointer initialization after this function when memory is
> already reallocated.
>

The title could have been a little more specific.
Anyway

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
