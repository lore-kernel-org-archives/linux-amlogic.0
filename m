Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC24E77199
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jan 2025 14:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9RwJfcGDiIc+hCLp7+dgdAbGgluya33E9OIBSfwmIWo=; b=LpbyOX1wxpcLsG
	ZNFJsv9w8JgkYT4hgByicNMKl2cXkUpSMjlgAXT9DxSd/P70ebyTln7E35POvd/oKMGHwekmJJVZ3
	KqswfOWFpHgL09GhOuCX/4A2bbPiBOBtbFm0ClJc3kgqyenFbLOGv6yvtQ24wXpHlQOzIitwoUE9b
	3fKfkZNU/Ug/m09ZcDZLK8B2rb889nxwm5/o+t5JoEpuUvs33sWeCvUkf4qDGIZVa68DwbB2IP0s/
	gr6uNKHcQahxsCqlDgSIHoxXPb512NsKT5sG+TENrdIFoP4W/A3N+n5Lsrpn/q4hZOH6p3JN4UwpG
	roSOGMyy9jxHhmsugt2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnrY-00000001Wn7-3HjB;
	Mon, 06 Jan 2025 14:13:48 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnrW-00000001Wm3-1BMF
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Jan 2025 14:13:47 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aa689a37dd4so75340466b.3
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Jan 2025 06:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736172824; x=1736777624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=deuzC29BtjFy0NCkULSfuChWERldX97tanuampvrqsk=;
        b=eVtkouhhHqRF0RrwDVdlEGN5KVSo37BvgU/opkPsYwHZ2JS+hhazCLjRYG9FNhRWKU
         wRBp8J50X2o1BjQh48n9RvIvbEddS5axoIldLYUsQcmR4a4SCJSFx4sUoGGL/0PKE9BJ
         sCt6nYflPbOJ8TsQFFcp3HO+aCxE4u1+6KqAUoLTr/QqxMIImaNgp+nDrW1iPbiowQdy
         5Dxkd4gdg5XL7bCMLkdCVngB/KFc5XBJzh68l8cpVuF7sgVlMuTahd19E2ut1W8ek8HU
         A8HY1z33w31gSLxBClPd+VQ4+7BwHItwknbk0pf9wNaI7CXf/YIv80CiS0wuFWbJmGac
         pnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736172824; x=1736777624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=deuzC29BtjFy0NCkULSfuChWERldX97tanuampvrqsk=;
        b=EzstCXsKQnme+LONMp4JkQwFcmYmCGAPIfMMmgW17I8h3rugCxOKRHIKr1bH/o4FMC
         H+ESikMKYdUbKumPxn2hoOLi/gwL6ZNHUijRDE9yLrIpv6syq1102Rzp/cq0W0ZCt4TJ
         I03jFHKUmKIjhcM1hiAEk1Q+AUnPJSX4fjIksEdO1ukGVjZZ9+ZGAqgIzD7hrByGozKK
         hFicf/BJ1ZSDtS+FKTLA0jLUjYQVsuH+XfObQH/FoJ7X6jIPOeR1T3cuGTmKeXlogOi1
         3ea/Vc1fB+soHsd16rAFNms212GzYARM8BmhHEPpdXddMPHRLsMzWmX8Ejxrqd1tVDNB
         BRKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX485rcZhBxpFefu9+nBiZU7Qb6CxU5ppM2m7srfzl6qkR2Y34sSNl5eusdxJzBT9nVkyGRZmwE1y65jRsy@lists.infradead.org
X-Gm-Message-State: AOJu0YyjPBNnHoloIXcGgWJEHw+WzcFA/iKD67DiW37XHxbIbZri29CI
	GLe6DFb/xmstEbNbEN8m4kUDgvoppODTJzvYxRrRVI8ALLMaQFw8
X-Gm-Gg: ASbGnct+nAstXXPoyTZmczp/viM6MkmckFz92V6CXgkRUUDM5kiIx8KPSDwZqQBg75A
	lBPYUOaUKuv2SoTyuzDc4nJWULwLlZ8cWqpRymAvAcEnh5jL2A0HEqA3cIQ6nUDeLoNVhH/7eoJ
	XhVnrVjIbYl7CnUgs2DGKp+ARmOlp48rzXWYUz9jLnEm0SY3EZ1gC+JlrX2KqGlRNXQPk39nErI
	JD4Xfqwkic61PiwCzq6YbaMH1MEK2rHUkJbDerKGDGsLTGYKBnMtusaibHkyAKGhyagbH9vAu1s
	MsXWXil61XxOhdtdP69NWJYl1yGmx0JUnX18slDmvewpsWcNplCmbMom4z+ycYg+BgeCpSRUZRO
	FwUgZNw==
X-Google-Smtp-Source: AGHT+IHYFAClER1tFlfRYUeI2kVSFpYXijNXltkCZwPCe+sxy0eaQoXBkfxp8qViPmzVW1dJIIrKEA==
X-Received: by 2002:a17:907:72ce:b0:aa6:25c6:d94f with SMTP id a640c23a62f3a-aac2ba3f469mr5630955366b.31.1736172824155;
        Mon, 06 Jan 2025 06:13:44 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a9f2-7d00-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:a9f2:7d00::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aaede7ef3cfsm1811342766b.77.2025.01.06.06.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:13:43 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: s.nawrocki@samsung.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC PATCH v1 0/2] ASoC: prepare streams on codec-to-codec links
Date: Mon,  6 Jan 2025 15:13:14 +0100
Message-ID: <20250106141316.375984-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_061346_323231_153AB0DC 
X-CRM114-Status: GOOD (  12.53  )
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

Hello,

the DRM subsystem has recently gained a HDMI audio codec framework [0].
This is already queued for Linux 6.14.

I want to implement a HDMI controller driver for the Amlogic
Meson8/8b/8m2 SoCs using the DRM HDMI audio codec framework. Internally
the DRM HDMI audio codec framework relies on hdmi-codec's .prepare
callback to be called. This unfortunately is not happening on Amlogic
Meson8/8b/8m2 platforms [1].

Jerome suggested that this may be because of the codec-to-codec link on
our Amlogic AIU audio driver [2]. He encouraged me to send this series
to allow hdmi-codec's .prepare() callback to be called - even on
platforms that connect it via a codec-to-codec link.

The reason why this series is marked as RFC is that I'm not familiar
with the ASoC subsystem and lot of the functionality and terminology
is new to me.

Also I Cc'ed Sylwester Nawrocki (Samsung maintainer) as codec-to-codec
links seem to be most heavily used on Samsung and Amlogic platforms.


[0] https://lore.kernel.org/dri-devel/20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org/
[1] https://lore.kernel.org/linux-amlogic/CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com/
[2] https://lore.kernel.org/linux-amlogic/1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com/


Martin Blumenstingl (2):
  ASoC: soc-dai: add snd_soc_dai_prepare() and use it internally
  ASoC: dapm: add support for preparing streams

 include/sound/soc-dai.h |  3 +++
 sound/soc/soc-dai.c     | 27 +++++++++++++++++++--------
 sound/soc/soc-dapm.c    |  7 +++++++
 3 files changed, 29 insertions(+), 8 deletions(-)

-- 
2.47.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
