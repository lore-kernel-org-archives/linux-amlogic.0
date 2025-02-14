Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0396AC021A6
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2025 15:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s4rmUnnItDj6dgHO1p4zdj3QzmC0asOhk0SUlJB7fbw=; b=UG65LXFi4D7TB2
	VVa4hkrPTYFzLP6ODmjQLqZ8jUwicK5ZPv7CD1wK18uRpOAEQQqXGZXO+PfsBEid4toPvKYhveUbl
	BJl0cZotGPwLpxNhql1w6n6959VrHMUqDMN3gmQ6/Gs0r38AGkrA4C+Twm7jKqEsvFEVCKN+mguaH
	vXG7pZ9Y3SheojLNE6j/S7n2y/b5pSp74zjDWT2CDVzPu68QaXKBWgjcju96+NXDkxbIyKDLkBM4s
	t+LqZb1OS+pXaG0896RYrwUHdinsIr+xR4JSecmU3UnxORCzdwChIUmdomYCfvGSJauB0Nnbj3q4o
	kIBaqPw0sK71hKV3y/2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixpK-0000000FMsH-3umo;
	Fri, 14 Feb 2025 15:42:02 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixgY-0000000FL0d-1XDB
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Feb 2025 15:32:59 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-30613802a6bso22999501fa.1
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Feb 2025 07:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739547176; x=1740151976; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHqSVsarbr9/GNSKcHw7mFlABcvHBZA79lxaZw7Ee7Y=;
        b=ib/eIk0ha8wW/Dx0zwcAPsmDxjzRI8ZBTiFwArZOwzkcpmxMowCYFXfHSa3w/YDxLQ
         qZ2A+XnwCo/YhKbVoaTJtVRLq2/jm9Bgk1oeIE9Oz0JUDg1Z0BjJGyRsQHysC68psRp/
         OmSMlg5jVkSPV6L2IdFCaolL5si3ClWT13Ewo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739547176; x=1740151976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHqSVsarbr9/GNSKcHw7mFlABcvHBZA79lxaZw7Ee7Y=;
        b=jQMmXhvSgRYo2/UvVoBcCGozER/U3S90MYqeqBrn0DgyItC/tpdtxgQJahycPyb2l8
         SuAbBII4QMjS1IyekLoQAQF0rFBBwqgvY/vtD9R4UzdrQah3ujXTqfvo+WjSnrHS6u7p
         NyNSBT8H+WAiTTL0/kk2g8+7koTCwvJLJ5Cs7UCnm05Y11INuz4SlfPdJbs+sASjGpec
         YVrwf61wnaUerKyysMsiOEecl5FnKziuLuCm9kHRmiuKX/r2LZiOSLjhqOAsvpOv6pB/
         LcEyIRtB8XwEiS1q4nJxePhFgsvf7c6lLSIuxNaFWkmhmRuxs1Tn3CNyisI/UV+Ttq4T
         KaAg==
X-Forwarded-Encrypted: i=1; AJvYcCUNw67kq+RMwghFnxa3OXHUCk9KF6GSWrTRoLYPeZF0431Aa+JopFgeVkETbIwk+NiXlL95rfg4S1Yc/T2F@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4/IJP+GQeMXdFYFwxa/rSUe6/YoySRU+wUq3l13h6q6UJYMzg
	JUs+m8Vvaf68eipvXWHRvfytsgck4EZ0vcanoWKBR2YesvQQO30OCvRPNIDbDpNxRvj//eEk07X
	wag==
X-Gm-Gg: ASbGncvzH7xBngxYLUmtLNDHDHbaF1n1uES+AJfAKiLw15UMDroWuIdHAv/bz35uIyX
	AlYvLFrG09cj6iCPHKe8gKEMVaxpl9BA8uD1MA12gZxVzSJwGvovWzRQ8W6wjwvlPWp2Lv/IfpS
	TeR0MpVHF0RNa4Uvueis8WdD0Xqx+PW7XF4bIWwPdR+eUwXsJW6+FxBqTcm1/swsWyv3H7qvRuH
	Mm8LuxErPgQmSJYf5EAMmdjpzDrVsP5jLt1zAhfU561mw+LbzcfcXOlXR0seRsj4CUIdaesQrJk
	vCuoKoUCdcXQuSgAmmXTCdaxcffWfPEtcW6yMQx5U8Dw1ZaJLkHl7wg=
X-Google-Smtp-Source: AGHT+IEJ8hsBM4XC7KTWCXr+/RcAUn8xJBSD7LM7TkflFvX9Z8OM8An5AyXLK+6CCXZXDmE6CpeNTQ==
X-Received: by 2002:a05:6512:401e:b0:545:ee3:f3d2 with SMTP id 2adb3069b0e04-5451dd8fb8amr2899290e87.17.1739547176059;
        Fri, 14 Feb 2025 07:32:56 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452e44052fsm125115e87.80.2025.02.14.07.32.55
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 07:32:55 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54505191cdcso2117084e87.2
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Feb 2025 07:32:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBW0A5dQ15mwFbk7Z4xBZzDQW+/c2v6IfwTpQxoAWu44GhCspglDdzM8FDSKmvWfSAKi9cJlrLnaZRqBP0@lists.infradead.org
X-Received: by 2002:a2e:8a97:0:b0:308:eb58:6581 with SMTP id
 38308e7fff4ca-30914801891mr14311001fa.0.1739546770563; Fri, 14 Feb 2025
 07:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-2-7edb50524909@baylibre.com>
 <20250213-crown-clustered-81c6434c892b@spud> <1jv7tczytk.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jv7tczytk.fsf@starbuckisacylon.baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Feb 2025 07:25:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VeSrZktEbxNXXTgD80QGTpW5b-WiXUFko+a8FUzmN+fQ@mail.gmail.com>
X-Gm-Features: AWEUYZn5Dl35ky148QOOCnARP_86rg2vhIKgVTUOs7s9KbdYhXOWWeRWr_r9yF0
Message-ID: <CAD=FV=VeSrZktEbxNXXTgD80QGTpW5b-WiXUFko+a8FUzmN+fQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] reset: mpfs: use the auxiliary device creation helper
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Conor Dooley <conor@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Danilo Krummrich <dakr@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_073258_400445_19FED8C6 
X-CRM114-Status: GOOD (  16.82  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgpPbiBGcmksIEZlYiAxNCwgMjAyNSBhdCAxMjo1OeKAr0FNIEplcm9tZSBCcnVuZXQgPGpi
cnVuZXRAYmF5bGlicmUuY29tPiB3cm90ZToKPgo+ID4gT25lIHRoaW5rIHRoYXQncyBhbHdheXMg
ZmVsdCBhIGJpdCBtZWggdG8gbWUgaXMgdGhpcyBpZCBudW1iZXIgc3R1ZmYsCj4gPiBJIGp1c3Qg
dGhyZXcgaW4gNjY2IGZvciBtZW1lIHZhbHVlLgo+Cj4gOikKPgo+ID4gVGhlIHdob2xlIHRoaW5n
IHNlZW1zIHN1cGVyCj4gPiBhcmJpdHJhcnksIGRvIGFueSBvZiB0aGUgdXNlcnMgb2YgdGhpcyBo
ZWxwZXIgYWN0dWFsbHkgcHV0IG1lYW5pbmdmdWwKPiA+IHZhbHVlcyBpbnRvIHRoZSBpZCBwYXJh
bWV0ZXI/Cj4KPiBJbiBleGFtcGxlIGNoYW5nZXMgSSd2ZSBzZW50LCBuby4KPgo+IEluIG90aGVy
IHNpbXBsZSB1c2FnZXMgKHRob3NlIHVzaW5nIGNvbnRhaW5lcl9vZigpKSBvZiB0aGUgYXV4aWxp
YXJ5Cj4gYnVzLCBJIHRoaW5rIHRoZXJlIGFyZSBhIGZldyB0aGF0IHVzZXMgMCBhbmQgMSBmb3Ig
MiBpbnN0YW5jZXMuCj4KPiBJIGd1ZXNzIHlvdXIgcXVlc3Rpb24gaXMgImRvIHdlIHJlYWxseSBu
ZWVkIHRoaXMgcGFyYW1ldGVyIGhlcmUgPyIKPgo+IFdlIGNvdWxkIHJlbW92ZSBpdCBhbmQgc3Rp
bGwgYWRkcmVzcyA5MCUgb2YgdGhlIG9yaWdpbmFsIHRhcmdldC4KPgo+IEtlZXBpbmcgaXQgbGVh
dmVzIHRoZSBkb29yIG9wZW4gaW4gY2FzZSB0aGUgZmlndXJlIGFib3ZlIGRvZXMgbm90IGhvbGQK
PiBhbmQgaXQgaXMgcHJldHR5IGNoZWFwIHRvIGRvLiBJdCBjb3VsZCBhbHNvIGVuYWJsZSBkcml2
ZXJzIHJlcXVpcmluZyBhbgo+IElEQSB0byB1c2UgdGhlIGhlbHBlciwgcG9zc2libHkuCgpGV0lX
LCBvbmNlIHlvdSByZXNvbHZlIHRoZSBjb25mbGljdHMgaW4gZHJtLW1pc2Mgd2l0aCB0aS1zbjY1
ZHNpODYKeW91J2xsIG5lZWQgdGhlIElEIHZhbHVlLiA7LSkKClRoZXJlIHdhcyBhIGJpZy1vbCcg
ZGlzY3Vzc2lvbiBoZXJlOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci84YzJkZjZhOTAzZjg3
ZDQ5MzI1ODZiMjVmMWQzYmQ1NDhmZThlNmQxLjE3MjkxODA0NzAuZ2l0LmdlZXJ0K3JlbmVzYXNA
Z2xpZGVyLmJlCgpJIGV2ZW50dWFsbHkgcHVzaGVkIHYyIG9mIHRoZSBwYXRjaDoKCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvN2E2OGEwZTNmOTI3ZTI2ZWRjYTYwNDAwNjdmYjY1M2ViMDZlZmI3
OS4xNzMzODQwMDg5LmdpdC5nZWVydCtyZW5lc2FzQGdsaWRlci5iZQoKCi1Eb3VnCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
