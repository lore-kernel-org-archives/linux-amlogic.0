Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC621C25B67
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Oct 2023 10:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K5OmP+8hpCY/v5pqE61vsqvKVea6TXmZH3Vwn9hMIb4=; b=ISJ7LVDKw8iFeK
	nHT7VQ+2/SN4G5t9bFaejJIBwCBxBRwN8MP1TnCrbQr5pJo9guNtq7cOuwa7jncmDgqh2k7hQ6ntq
	I5bxSJ52T1uC7WrMtZEttYxaq4bPHtuGZjH1KKx7Xm4iEk++RPfWx6WMn2o0HnUL9C4SQ+MgvncE6
	7dZeKCzOMg36sHIlVt6Kn2Eq8V1teb9tj0ew6/ufvPP2xC9EG4LdlIPcwhpxGJdruLuxUY1tg+jvH
	A4AXQIL3hCMdfhTkxomReF3Eyfb57jIuWbpiDcIE6X/BviW//GVIMO2zRsKKuQ1DJu5T4smURmzgW
	Q/FfOzBcxLLQbbFBQ8PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJgQ-00G5GJ-1O;
	Fri, 27 Oct 2023 10:03:14 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJgO-00G5EM-1Q
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Oct 2023 10:03:13 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5a7fb84f6ceso14608487b3.1
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Oct 2023 03:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698400987; x=1699005787; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YXE7lgarxwuv4Xl7UQk0cudPQAILR43rhjN5/cXQAig=;
        b=rp/7bn0wlsAME9mstqgHK9el9cKvqhf5BC/+vBH5rCwZh2h+/OrbQplLuLeqv5asq8
         QVxbEj/pzlRjYTemRraNZOofPotVWf3g1bgyaibETVZoVTFs8GrZtUv/yJTwWr6WmWUc
         ngZohnKEMkukHIB24poY3r4Q3sgFoc6sw2XPgCpxbgwhJv411c1WvGldhEQj38cLwaAi
         3qh0qt7CBA8nitI205BeOsZyzmYYxB2I6drZdrvDk5vljAKjl50vBlXi4eoRc8unrheg
         NgNRLFUD2KFT1WzQs9XnNEEgPq/lqeMEltTfxAYYWvATeRb+vuBge5zBxsr5iVInX+8I
         uv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698400987; x=1699005787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXE7lgarxwuv4Xl7UQk0cudPQAILR43rhjN5/cXQAig=;
        b=tnZZgjfaIwqsvJfnXU4PgQnlnTS5a0pusw0suvdib+8gBUE6XAVq+wRv7l8o+m0PH/
         BQyYrvvTyRchxgM3PmqAW6R6oXhpJ5GiF7kfmbdABRImhR570iktG+Zktr7I/yYCWxPI
         RO3WV5ZORhFOQmpDDfa7Jneh7rgS/cCToGDukVlz9OzwYeerGk8vrwkRX8DK26OYaUhG
         SCei7pw9tgiEZR0f0agzvfTxrwPmCuyB4YF54s+JcmeoJK0+Zu4tBEEzAhcIqMGhEXgT
         3oyhvKF7S3hrCB0hQEEAGOGo2FmMh4oBbEYYvZ4YjrMYI1ZhBCPQfGjNYpXnNbYlfrQ3
         Gt/g==
X-Gm-Message-State: AOJu0YzZQITHJGDoYdqFIcrJEfqAYRfolLUKWr1x+qLjvNCqO71XZmQi
	p6/gkoiPjKuXKvq5OfE5yRjB7Gx1iFyvE4NNQl9DaA==
X-Google-Smtp-Source: AGHT+IFYbP/Q1oQDF4bp5AJQ1qmGH7ABvag64Mb4Rq9m8K4E0PNVBVrXn6fERnyi6wwBkU+O2mWw4VNUzTnB2t4ERAQ=
X-Received: by 2002:a81:c80a:0:b0:5a8:5824:b953 with SMTP id
 n10-20020a81c80a000000b005a85824b953mr2187884ywi.8.1698400987537; Fri, 27 Oct
 2023 03:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <20231026073156.2868310-1-rong.chen@amlogic.com>
In-Reply-To: <20231026073156.2868310-1-rong.chen@amlogic.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 27 Oct 2023 12:02:31 +0200
Message-ID: <CAPDyKFr_NkZYEHN-9BPTQT1K9nMA30_vyry-6pz+G_iAw4uB0g@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: meson-gx: Remove setting of CMD_CFG_ERROR
To: "Rong.Chen" <rong.chen@amlogic.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_030312_478728_B98D199D 
X-CRM114-Status: GOOD (  16.70  )
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

On Thu, 26 Oct 2023 at 09:32, Rong.Chen <rong.chen@amlogic.com> wrote:
>
> From: Rong Chen <rong.chen@amlogic.com>
>
> For the t7 and older SoC families, the CMD_CFG_ERROR has no effect.
> Starting from SoC family C3, setting this bit without SG LINK data
> address will cause the controller to generate an IRQ and stop working.
>
> To fix it, don't set the bit CMD_CFG_ERROR anymore.
>
> Fixes: 18f92bc02f17 ("mmc: meson-gx: make sure the descriptor is stopped on errors")
> Signed-off-by: Rong Chen <rong.chen@amlogic.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/meson-gx-mmc.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 9837dab096e6..c7c067b9415a 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -801,7 +801,6 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
>
>         cmd_cfg |= FIELD_PREP(CMD_CFG_CMD_INDEX_MASK, cmd->opcode);
>         cmd_cfg |= CMD_CFG_OWNER;  /* owned by CPU */
> -       cmd_cfg |= CMD_CFG_ERROR; /* stop in case of error */
>
>         meson_mmc_set_response_bits(cmd, &cmd_cfg);
>
> --
> 2.42.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
