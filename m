Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBA6C79F9D
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jan 2026 15:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QNkyREt3cGBV5dFWy5ehVMyTE0Z1M43Yiw9kJ4OQzS4=; b=hFhNnmZoY9R1nH
	whjFqRf4KwcI7KSwdu2QMqbAR+SL8kuBlmDvh/1k6B2lb+3OMPmPAUvhAJjgfneNvUysHKJvlYOzt
	qjweoSYdBt4SEaoJPHtCcpHN8RiqiGYkefYK3WXRd9o1nXcpx5TPqzFBC09V6X8h40mPlIt8HVsrH
	mviWF1Pf7HWu5s1IGrtK7L5CMo+JZZpnqbBxcidj6+RxiGNwkocjrjior8JEyhYFqS1FhcgeKJV3O
	xo1MacFuP3CB/TvVIpLm40sJfEKka0b66roTtu5Jcx3LRvl+Nv5JdYynKGjcCssgFVgOogbOoW4E1
	T9hy7sf9pfFZgmIlpLWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmVg-0000000Bbyg-2oX5;
	Mon, 05 Jan 2026 15:28:44 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmVd-0000000Bbwy-3ExW
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Jan 2026 15:28:43 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-47755de027eso299325e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Jan 2026 07:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767626920; x=1768231720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PB6e08EWlcYnnLEyvdrJxsH0lwpkv3EVQiwtaaaiNhU=;
        b=kXeetpMuElrmUfi9IDpo7Q6CbIYffl6OZNt2TpLQSB7f8XgPCM4hjJJeZzoImIyxr0
         pKvSxFd4erRjE0yle4E+FiAN4YBYWyIw99a0ErWtWW8Ufrfr2aBH7pYL7G9O13pASFJI
         0NWsxTWACPcuFGZ5vzkV/e4iKih7c7qBgw74z18TKkzeXtdCLDHYawHxvPCe1LqGg3Re
         az19r9WYACnxMzoLA3GxuTkPNnXu2wKGj+VZOAykYT418ZMhm2L9yDxIlZJ2jp+FgUhJ
         XJQAjJOTST5xfhUDZentGUVi2WttnoPw4BCqL3D11yt0KeYKARaLiD/xKilCPO20c92P
         OZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767626920; x=1768231720;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PB6e08EWlcYnnLEyvdrJxsH0lwpkv3EVQiwtaaaiNhU=;
        b=Xt1lb94khXDZIJoFI2z1Z5ICzVennlO6gxpnFJU5babrZhamZXBchaNoLE/hSkf5hX
         RcPcOgSgjRx61Z27gKOYVJ1/zkpZXvV5g8aAhdFdpRDvg6LgcF8ayHnzSVHdGwKJUbHD
         AlxXU7OXy8bioteAMFFqvSQfI/5zYooYfyS9XGRBTN/Nrvf5xK+/Zdzja2v1aOUnaV66
         TENfoYFlWTuCFTBUHtuMWZcmDG1mxpf94fUWnQfYe9jCbcXYpKbTHePTMblHVGnuIFPw
         Qpdj9UBsWIcEIl79I0Q4YI84CdUxW1qI+qaTG9itrSLItFuWGE29oVveMU50zPobc0Lk
         tDww==
X-Gm-Message-State: AOJu0YyTlTRYF1jRL3nr9mxqYjy8A0zi7Mj+WZS8SnnNjaClU+JsgsUX
	RCIlHnMad+550pLT2z1c86cIzUfGcZrEWMyRnz1suOmLBP0CZCrg51JugOqUxG9UL8s=
X-Gm-Gg: AY/fxX7k3bcNFqBuU396i6nG+DeAVrTMte/ju/UksgM6i0KyarMkJe6fOomUa1aeW20
	nHkcwWlEFTHyWPdPnVnHqRyzREsiAb00t//FFxq5PwKXYv3yWCiu7yyqryUSL2w76CIQW+7Znxs
	bjsq3oEdMgNEavBV9mU4EACBN4b2+KB0LSSffXshNtfrVc0yH+Wd5pWIwkHTglH3Rqjj6GmNjJd
	dwpKGQHMXliz6WbtFe0m3hp+cBXGMlYfFgC+6+SKwc0y/U35Fu+FzGYSnUHDSIQFM+vbLbrEirg
	KjiEcGeRljSLlhjlX41biJbcHMqxGbHWta3LigS1QRVMDG0GWykPUueE1zMJpJdIf+ZazMs2BrK
	YidBQCrsoUNAfZXxaG5BimxZGHcQKAZITd1X8Kvop7MZLZ6L5PY85NPcP/HxZBnHIFGjpLIiek6
	UFeOsPVk6fqLWI5pxKceWaULT5iZwklSs=
X-Google-Smtp-Source: AGHT+IF9dg3EzRKJCUJkIpaOYmPDVUtUlHUdtyUXwFpDzaH40VuJcbLqERy5ln9Blgk3u+fx9gjH6A==
X-Received: by 2002:a05:600c:1550:b0:477:7991:5d1e with SMTP id 5b1f17b1804b1-47d1958b250mr638504575e9.25.1767626919903;
        Mon, 05 Jan 2026 07:28:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6c0c148bsm58247155e9.18.2026.01.05.07.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 07:28:39 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
In-Reply-To: <20251108134236.1299630-1-martin.blumenstingl@googlemail.com>
References: <20251108134236.1299630-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RFC v1] drm/meson: venc: add support for HDMI DMT modes
 up to 3840x2160
Message-Id: <176762691920.335654.10635601419658872459.b4-ty@linaro.org>
Date: Mon, 05 Jan 2026 16:28:39 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_072841_812425_896FA5C5 
X-CRM114-Status: UNSURE (   8.19  )
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
Cc: maarten.lankhorst@linux.intel.com, linux-kernel@vger.kernel.org, mripard@kernel.org, tzimmermann@suse.de, tobetter@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Sat, 08 Nov 2025 14:42:36 +0100, Martin Blumenstingl wrote:
> Commit 5d0bfe448481 ("drm/meson: Add HDMI 1.4 4k modes") added support
> for HDMI 1.4 4k modes, which is what TVs need. For computer monitors
> the code is using the DMT code-path, which ends up in
> meson_venc_hdmi_supported_mode(), which does not allow the 4k modes yet.
> 
> The datasheet for all supported SoCs mentions "4Kx2K@60". It's not
> clear whether "4K" here means 3840 or 4096 pixels.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/meson: venc: add support for HDMI DMT modes up to 3840x2160
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/26ce0b87a815c71d24fd193a81c06daefb60959f

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
