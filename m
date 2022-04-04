Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0579DC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Apr 2022 08:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eFY0EiuqHGdu9wMgafGtPSxGCYMSJPbD3rWYghF9uCw=; b=dBdKdYA7ZfqWMA
	0oQU4h+KjCGtr+HALqTGjpo+tFFWXOgvVD2DQG9aXXORozjD/ReBSYd0B6rVWsus7ATLQC3/ja7aT
	F5wBb4xYO87yAhhXB8R7cqVvmyuIvgjHfZ4qsWbKy/XyqIH5yA2RT/21SKymWbB3zGMejpbHI/GCP
	Vz5B49tzafSKG8HMh2SyD9TCMRz+98vHeBclo0M2s+9FhgJ/KhiKdwT3qJFGQRhplwvKCFARSocEw
	fzbdsEumcVrHhGMVH3uv7Lv3asNfG3HiuJ0WimgpeRH0fNei8d4d28AJnJBbjNfHn4UPlXKO3oyc4
	SL6hPH4ru9rQk/3C7YRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbHfB-00Djs4-Ky; Mon, 04 Apr 2022 08:02:13 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbHex-00DjjA-AA
 for linux-amlogic@lists.infradead.org; Mon, 04 Apr 2022 08:02:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 p26-20020a05600c1d9a00b0038ccbff1951so5718461wms.1
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Apr 2022 01:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FMlxUg9R4XMvayD2D6tTORqQnMzt34ahkr+1IIPpZrk=;
 b=xugZeTvVg5ASBCvLguGnDYkmRLxgPUfEhleySeiR9uFXVQxx+Hr8V1YFRV2BUDwXuI
 msyLtkIgyC7A9wWhZKlYg1anDc7Iju+x8iRBqTwy1j04UnbSuIirNEPkFu/6wO3m9p+8
 f9FNRYu3HOXNXKLbfoHYTVT8BjqQSPtatuRKgSDo1ThJlVmi2Cf6K0R+mHxPQDeVQiO1
 5Q9uZ5ZqJIlBr+OZp1InjMQUi4L0ZN4pffk5D9B3CuQWx8vFmdgArsfM1r28PSbPAdSQ
 0AZ8PH4SLfYjtyoicGP5lMaqZakfDhZxLmz8PVAO4yltGyK4EexIuhCNYPgYcRtX9540
 XzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FMlxUg9R4XMvayD2D6tTORqQnMzt34ahkr+1IIPpZrk=;
 b=Ej15aSVmNpZwuHcj4lExDi5mlSiPDtlngK1ziBmOaiRXqUkdbYvRaxEWqKRzl+iRQY
 Xnod1dIjpCHlRYA8BX2holk25AzT2KjzuPdZxLGFAT3N4IEINLMo6q3HleGX8r20laU0
 HVbGwhXjZUeGpK7nEQ1M9VZDzMg/nEJHZqntNHWGBQctb1WBV+ouqgot8caN4w4pNYst
 eSrF2IXFmGBCsK4XkbwhAOkGmzdqIhXyJPnuphI+emhSBb7vwKX7iiGEyYJuyO7S6Fe8
 s34VcpzToByWsywIDNLRfwl9Qdz4nVQHdN1NE5DVrrUF3iiziV690Z93YX7gpaB1W2cw
 pbsg==
X-Gm-Message-State: AOAM533Zx2Lk9+lhzq1f2kwBO5+jW81M3XDdRVvLDOniRp3vbq57AGD8
 69OHOYripXdESWnUR/QB10Njqg==
X-Google-Smtp-Source: ABdhPJwnvBXWc2QrklzwJsBhpREtyKwtTZ8QEHMMLvvJRy0/5hd+0G+oXty5theGkKG3n7Y3e+KiFw==
X-Received: by 2002:a05:600c:1d8e:b0:389:d079:cc0 with SMTP id
 p14-20020a05600c1d8e00b00389d0790cc0mr18377684wms.98.1649059314426; 
 Mon, 04 Apr 2022 01:01:54 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:1add:1b28:2457:eb46])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a1cf30e000000b0038986a18ec8sm8586159wmq.46.2022.04.04.01.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 01:01:53 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>, Vyacheslav Bocharov <adeep@lexina.in>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/4] arm64: meson: update dts for JetHub devices
Date: Mon,  4 Apr 2022 10:01:52 +0200
Message-Id: <164905930207.1797085.9678466232916244683.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326075110.1462301-1-adeep@lexina.in>
References: <20220326075110.1462301-1-adeep@lexina.in>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_010159_458963_9843613E 
X-CRM114-Status: UNSURE (   8.12  )
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

On Sat, 26 Mar 2022 10:51:06 +0300, Vyacheslav Bocharov wrote:
> Update dts for JetHub H1:
> - add bluetooth node for RTL8822CS uart port
> 
> Update dts for JetHub D1:
> - add ZigBee serial alias (ttyAML2) for backward compatibility
> - update voltage regulators and SDIO config to match board's reference design
> - update max freq for WiFi SDIO
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.19/dt64)

[1/4] arm64: meson: add dts bluetooth node for JetHub H1
      https://git.kernel.org/amlogic/c/2bda08dfc501967a7a7bd6f77f04afef14dc7271
[2/4] arm64: meson: dts: update serial alias in dts for JetHub D1
      https://git.kernel.org/amlogic/c/cf94e26508ad411c2a618b00dfaae515affd0ca7
[3/4] arm64: meson: update SDIO voltage in dts for JetHub D1
      https://git.kernel.org/amlogic/c/81bbd2bd24a9ebac3871b293060df50445458c79
[4/4] arm64: meson: update WiFi SDIO in dts for JetHub D1
      https://git.kernel.org/amlogic/c/87a87657249316616138c103c2bdb7525c34d987

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
