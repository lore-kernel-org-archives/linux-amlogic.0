Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D652DC27C4F
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2024 07:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUk2N9fuTEegonQ+iXHXkC+aHCENvugZuut7InVNX98=; b=RVywZD6fh5qurM
	N8gRn/xyKeHCvgf8asaF9iyLFfY6PnVRJ3TCPpD+HhmdFgdiDkJLSU0CttiUAlJM30QOzRCcYeCjB
	trCqGj8YD3lPcLXvRy2NYAOWSXmUrZFbA/S26PI2f6ixq1V8KWUCWz0GDyOhSvE1ozYlzqD+6tx7A
	QcwklmDTe7vnZAUzZjfYigF9HAeAGJlvSnnOq/kTEFm/MwIAznsPdzTc2TdIzib3TiNG0voxlqCSk
	s79ph7TQTrfrDtiBh7IvcYrkBLeAR7vwH7XK1pas/YOCUvq5tKcgDhO3P9CPSp4EGxn2PnCPGpVJx
	oxilBHQU4dXKIiwo/OHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMN7S-00000005kIN-0F4j;
	Wed, 26 Jun 2024 07:31:06 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMN7P-00000005kGm-27wu
	for linux-amlogic@lists.infradead.org;
	Wed, 26 Jun 2024 07:31:05 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-36226e98370so3826538f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 26 Jun 2024 00:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719387060; x=1719991860; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tv9djtWEOzxTaL6lh9T+uBzCSiUjvyz1rjw0jY3cUB8=;
        b=SFAFTqBe8DBssDiMNL03PgjlRfyQkjtOicurUUzujpvQE8aMEF0HkwZ7ZuQq6JTNjj
         6niEr6pNjjrLfc1ecvOJ1bJ98sAW/lGS4YylikD6xB5L56FaXYlPYYtMqXlOlh2TCbZc
         A3LF+8HYhYo/UwC4oawQbbQlWOls9NzHcpkXtxPecU3XHLELI8emfeV6NO7k1caHswRi
         Ae1GK0JyaMe3em+R3seBwCraJQ72kzHQqbp+iaVz8jdMzYzHj/nSxbTXadQnyv8YrHBr
         RiAWdc7T8nWDhbkZOWcJwA6/Un5uBRQy/yr8umYCpVI07fTiH2ai0lX9HZxKrI8oMH8u
         QlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719387060; x=1719991860;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tv9djtWEOzxTaL6lh9T+uBzCSiUjvyz1rjw0jY3cUB8=;
        b=tbRDo0O4bhb7R2xHioUpGHKAgpaZBcnwzmqQ7OzGRYzlJNSBCjbwROTQsPwAJvbbPb
         Mg0eu3svVxOMnJlylfNQegfqWg51ZoJhqvnXM8fCZ7WE7NwEO/QFU9ackFk2vgTJ74xf
         uh0/mkOOU/0wz51wokgCWcL+6QRBoN2SATgkN3kfrrFerfHDaHyKFIjLvrGJNJCs/LKd
         cR3V+g+qND3iyRZm5BlBhQFaRM7nJ5NnakpPosomK5fnVmYDdccGEMIRQL4fXVyVZq4i
         W+gnI9cSTQjJU37nhgu5FXo3zTcZeVgJmolz/qj35YLnUQpUgso7VOTzgB9WqnDCfcz7
         gXpw==
X-Forwarded-Encrypted: i=1; AJvYcCXzG5IPP6tSR7M600jp73QX8nNJWpXj7JoJaOB+O9LDvWtbYL3zXVflYY4Q2dE5HknatfSVqJEiyRtfl1fpEnz2fntbX9XeES2JWUCQ+hffgEg=
X-Gm-Message-State: AOJu0YyQ7XrcEZtSkHM4vM95n/ipIPU45SREz3GxuoittZ2ib/irsPFN
	N3RJf5P4cIe4+AywkqJS95dzwP7ckqiSjo8/V+hbQr4w2YpCxooJy5xRFVTlQ3w=
X-Google-Smtp-Source: AGHT+IFBXULLdxfeEky/0MesQJ9m6VVrSGMEmCaQc90xJfwO02ZaFbxqLfpmYopxto8Z2nDrU6fdNQ==
X-Received: by 2002:a5d:44c8:0:b0:362:4dc7:dc7b with SMTP id ffacd0b85a97d-366e965298amr5956254f8f.58.1719387059782;
        Wed, 26 Jun 2024 00:30:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f6769sm15081665f8f.5.2024.06.26.00.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 00:30:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org
In-Reply-To: <20240625145017.1003346-1-jbrunet@baylibre.com>
References: <20240625145017.1003346-1-jbrunet@baylibre.com>
Subject: Re: (subset) [PATCH 0/2] arm64: dts: amlogic: add power domain to
 hdmitx
Message-Id: <171938705880.1642577.605500417615578025.b4-ty@linaro.org>
Date: Wed, 26 Jun 2024 09:30:58 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_003103_656001_C0C38BDF 
X-CRM114-Status: UNSURE (   6.74  )
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

Hi,

On Tue, 25 Jun 2024 16:50:13 +0200, Jerome Brunet wrote:
> This patchset add the bindings for the power domain of the HDMI Tx
> on Amlogic SoC.
> 
> This is a 1st step in cleaning HDMI Tx and its direct usage of HHI
> register space. Eventually, this will help remove component usage from
> the Amlogic display drivers.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: meson-dw-hdmi: add missing power-domain
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/c19f15b1e056a1ab896d54909f75febf70d98be6

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
