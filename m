Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C15C25B4E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 09:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KkWFlMOjhUtV4EOJZB2ocrdjtNqekhMx8TwO9koDCs=; b=bgr0I+EUKrmIp7
	UEM9sfrDHtQlhFDLvhPgPJs1e1okN8yDqd7uwxVrMON+eEj1W+t1Uv1dkCcdv1T9wEJSQTlCeS2nU
	Fewe6NIKHbGQ2OQQKNwCddcsy6bc4+psD4DZxVqJrPgwAeZT+NIq4K2ANuMC5tfFFvc28DyAp+4lO
	nTw98vwvsezirHZTsNeqssrLLxFDf/r3Z4J8JbSWKieILigvU+XrmIyoQ8B/ivr6Gq2wXtFieIl9x
	u4xOLcAkC9HMI0FF6UWxLABYkxS2+K2vQ7S1dRY5HkIqzOpsagKSpJJWbeaoyaFojerDZq4FScXqe
	U4QDQAWrYNQ+CNM9berw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFd4-002vyu-VW; Tue, 24 Jan 2023 09:30:11 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFd0-002vvU-96
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 09:30:08 +0000
Received: by mail-wr1-x42b.google.com with SMTP id d2so13215948wrp.8
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 01:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=zKq2cWJ07Jm1Xl6OCsQ8x5Ne2Ms3VmQjYEYEPzC1T/c=;
        b=I+tuDdwEKw+9ohkGwY3IF4uCxUk5PRjJDNBURlph8boch6UG6H0iNbzl+ejrR14Lqx
         uZF+LRaf0w287RHCjMKI8I7GRM8OnmaiusJUQCHXZ81KvcTMDn3CpHfpKF3U80HLxLil
         ulvu9yw+FqtNb22vP1SiVelwMtbPytU0KbLuZur6v3fgu3wV6k7c0e8sdKEN1xHdEg5b
         U5B1+2g0qfNBcadwDKkCyUc+USMJShKG0m4hCJh3GWs44CVVWo1+DRZJ4qOUx7iBiO68
         QWqiSqWguYc+kl+KmJ0+WD5GYRkgol8Awu0oNT6C8XX+lRxcxmSiaEfqTFeXxQb/U0Vj
         MX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKq2cWJ07Jm1Xl6OCsQ8x5Ne2Ms3VmQjYEYEPzC1T/c=;
        b=loTqa8cM/uT486u5P6uYWKNLlIQrslZu9Ui2TdaZAOlCbsbnFFLsQ5QkuLjCRnP5er
         YQcYZGB6mUAHb0TGwpX94Ma98XFKSepTPr15b0vcHgSmwpjNuMONXcmXRqNSPcx5qPdv
         5DGI8Pt2Gj/D3SjoS2a4Y1HAn32WtXTiGqJVY6QsOqv98OczTZ8H4Gjier1+heNd5Tdy
         APL6aJ7vcACNNn481xkjWSeItJthZu4hIt+nwOj+Ql7bcFC/1038aOWzaayx8xrLpXhC
         hsJ8aaLwb2sbFLoNo5fWSuAKelMIBJl8s2aSU4dq9gLBgfopgSWjlCxyfSWM/birll+F
         EMJA==
X-Gm-Message-State: AFqh2kr20GHWweQ9eHqrUljWJ0c+QNGfvNjG0/eGBaAw1x36md+IXzer
	cLJ8vquZc+x9iqnsPrPjiHveZA==
X-Google-Smtp-Source: AMrXdXuMCqzhrMJs53QLSqksE8sdifA96ZfMslWvX8EzmPm7sCeVj1H6MGHvlCQ6DtGnK4yEgoGgBg==
X-Received: by 2002:a5d:5b18:0:b0:2bd:c2ce:dd5a with SMTP id bx24-20020a5d5b18000000b002bdc2cedd5amr40770157wrb.16.1674552601763;
        Tue, 24 Jan 2023 01:30:01 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id k9-20020a5d5249000000b002bdd21f25ebsm1413017wrc.71.2023.01.24.01.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 01:30:01 -0800 (PST)
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
 <87cz74u1c7.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 15/25] ASoC: meson: use helper function
Date: Tue, 24 Jan 2023 10:29:04 +0100
In-reply-to: <87cz74u1c7.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1jmt68gu09.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_013006_357197_3C9D3CE1 
X-CRM114-Status: UNSURE (   5.97  )
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


On Tue 24 Jan 2023 at 02:13, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Current ASoC has many helper function.
> This patch use it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
