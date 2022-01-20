Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF26C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jan 2022 18:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R72iAX4n8zjippns6z+O/CmUW7WdPCWVFg+PkHNKDRo=; b=nyyVt9Gu14iz+0
	KVytQjXHJiA5Rs+409hTNaaRzX7s5rQ6Q05z7EMiKTSh2OIp5b0HbgNPNyCGVh1c/y34y49RSBK+k
	lzAjdIank+z2ciPaMJ+rtw8FIulImhXBDRdgjykh4O992jVYkqHWXFfRLpGCKYtCminaytA0ME0JZ
	VTqAbBdbRdQ31uvxyoON42QA2Pc9GiMtvhj64SGbSwd4ZWK1844QFkowBJ0vAX46abnLfQ4ls3QT0
	R9m0p+gNlNOZhNKpHSZAmOgO9kYtF5QHiUMT7zXudQ2kbKKJXPliiJeMWmFCb+WwybxatmQhn0xip
	Vl8FPYe9bkvZT2BD5ptA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAcFS-00CoDr-PU; Thu, 20 Jan 2022 18:33:26 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAcFQ-00CoBw-35
 for linux-amlogic@lists.infradead.org; Thu, 20 Jan 2022 18:33:25 +0000
Received: by mail-ed1-x536.google.com with SMTP id j23so27389635edp.5
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jan 2022 10:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AKUPvYgb/xwsTq6T7e89Z6kjzAJSxkrEuwSzEueenMc=;
 b=g0plarazHPwI4qlq/iLNZg6VCNmjr7t39qqS/R7UXrPsoagw0roK4Oxy1FcqigzWVD
 5qzEWL3uPnCjplkdgeow3xuV+Wl+XkoCQT8Bzf0+deLaZeo5j/ueuLPszaRkRnEzFPyd
 L7MEhwee3mTd1zxtK1EYURmQ5DVeqXVW89Vbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AKUPvYgb/xwsTq6T7e89Z6kjzAJSxkrEuwSzEueenMc=;
 b=CCQA76lh/N3tefthD8wKjARd50Z7qjgva67jfSmpfgp6sYyXwAnY39cIDYmr3XdDWt
 OnHwm6yfTUR7ZARt/mPWWRH2XDMjCWJnfj+MJFEdDl4pnCwMmHYp3G4Lq+TiV6moPkVv
 wBKo1Ar3MRJSReYy4iOsmLWcw0yaeuN6YzjB+e8258aqEfbp24EEW4+ZBX1jMCp8SWm6
 YbWahWXDj8PWEoY/bYS50VQf1WrBseZI53SQsPtL0+bPRAV7hw46GHzbWwYC8qWVffL9
 sgx3hGq3N9SvOGRN+TGHtb4kR0u/KM2sKQnQZkTQBsPLC7SOX+LYoErmfVUJacLuvSgs
 s18g==
X-Gm-Message-State: AOAM530fbLxkxt9i9OYNvtnDX2VUtyYgP4Eh02g9IC7USpyS6hW/PjCd
 iv6VpL78rCvY7qbO8AyJAfq6YCYQhGnrZU8pBHn4CA==
X-Google-Smtp-Source: ABdhPJwt+XAMRl17Scsp8wwhWEmsO7vFjwY7BNMmq+eFOWefHMWaw75EXBzrtVVz8ykqngqnRTHQUYrvu2B/OHbFdOU=
X-Received: by 2002:a17:907:3e23:: with SMTP id
 hp35mr157023ejc.760.1642703602005; 
 Thu, 20 Jan 2022 10:33:22 -0800 (PST)
MIME-Version: 1.0
References: <20220120083357.1541262-1-narmstrong@baylibre.com>
 <20220120083357.1541262-7-narmstrong@baylibre.com>
In-Reply-To: <20220120083357.1541262-7-narmstrong@baylibre.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 21 Jan 2022 00:03:10 +0530
Message-ID: <CAMty3ZBdzW++6mCaqCLuL0QWwY7ve1vmLSPhaS8QqYji_jDXSg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/meson: add support for MIPI-DSI transceiver
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, martin.blumenstingl@googlemail.com, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_103324_177912_7BFBF793 
X-CRM114-Status: GOOD (  10.88  )
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

On Thu, Jan 20, 2022 at 2:04 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The Amlogic G12A/G12B/SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
> Glue on other Amlogic SoCs.
>
> This adds support for the Glue managing the transceiver, mimicing the init flow provided
> by Amlogic to setup the ENCL encoder, the glue, the transceiver, the digital D-PHY and the
> Analog PHY in the proper way.
>
> An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
> DW-MIPI-DSI transceiver.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
