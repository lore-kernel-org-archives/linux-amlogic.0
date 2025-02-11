Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5500DC0219B
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Feb 2025 17:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BINfTwZzVfvkgDqdV2RH2flf/YdeHwQZitgWcwwdbYU=; b=XR6o9NDNoTpaWQ
	a0ReHwtMy0GpJEqsjim23nvspt5t50NBgR54rLGGtY/uitonm3lFwEAqCSo5hLCyO9tV5oQqQhzNw
	Kau5GTuleBEkaDi1pem6rI/TmfC2mlBKWxFAiNuaiFfys1wZ81TmP9lMsJsnooarD1DR9fawMRB+L
	8+ER19fJhfNLqHvKtJKrMy7UVf8MUQoPZGJ4c5FzelU7XC6CKrapJnPWrRCG6jInWMPjn9Z+q/YBr
	5kc8C8eyXmLWQTQR84cUpuRKiDaj5YI50NS/kam4u3Fb0Rp6GBhcU6iblIO4vFQCteI1+EAgDj5GJ
	27sC+zTYrTj8We/0Fh/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuHf-00000004iLG-0ojc;
	Tue, 11 Feb 2025 17:42:55 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thu3o-00000004g1o-2NkY
	for linux-amlogic@lists.infradead.org;
	Tue, 11 Feb 2025 17:28:38 +0000
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43934d41730so31987885e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 11 Feb 2025 09:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294914; x=1739899714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDYe4zVCJHl1J7zmO8YwQPUsImFhukXxkzdj3E5Ja/8=;
        b=pH4t7sq4Y0TeOoc8wSeymrHIvLWRkUXSjdvDRlUWydnvJ1IFJaVVP3/mNsdg66BCrp
         3SicsHB8O4NqsOhZjf9E4xIEhbsM+Cx7w0Cy1RQGIw0LxZXOuZS/3hg/crWoT1/rEaci
         5+TR7dTQgCaM/DmMneGkVRutUKldGubeAKrLSiSHNI8tDGXqSSVYRhF4KzFP798lQV3L
         4IHQJfKIJVGhqZ5eo3uW9lCuNaJks3/qZpN7Wd3q/7zGDxk4a+rxE4H+FdbDEctHM/xg
         JuDXd9J42dxyeszymfVQc5kqdjdiLoclQmq7F8Jb3LZZfYzFro2NQ/3LgmSL2GcyC1li
         tbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294914; x=1739899714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDYe4zVCJHl1J7zmO8YwQPUsImFhukXxkzdj3E5Ja/8=;
        b=UGYuelu+4Lv9PciRc4afA6kGW3tazIQqLe72CLPB7AhpP+gf3QtmR0EEl8Qd5Qr3fS
         khslhMUTPudjPNDh772L2MM2467d7qIiD/Hoth5NBNVR2rt50heotBl0skz8NKD+aTvB
         WeP461CypZnxkD1J9SnKySF7nWt6OnajwOV8jgrRapCEOR3dXqg9hLDsRNPvnsiONNDL
         +JR56MNJRblThi2MKymgE6+/3oEZNjNXuJCV6EEdNqRaCFri8QqIymSHl8+bdsry6xH2
         84HwWRPW6LBzsulbivRZAM55Ea+n7B9c29qQUH4YHUIUNvDoiEIUVxE8st0xlP/5ESB6
         0mxA==
X-Forwarded-Encrypted: i=1; AJvYcCV/EAM7/l/QTvLKXTNMqAsKvEsfbTocnB4cTcHqqtQqoBb9CyR3v9/K2s2F8CtvtbdEKebDcu4pOYfrWIVq@lists.infradead.org
X-Gm-Message-State: AOJu0YxnGBQk2blxjR4tWdzDgIAy3aaWHGCuvKOKBnj6kszliSajlZAH
	viVxTAftj2Z06wko+37Ey3/U1rYtJA2wlZ0s7rd/08DldIx6TOgLrcX24IZ/EWQ=
X-Gm-Gg: ASbGncs2yiJD3AGQkT8+LTtSmt7xelV3DQvSIHVTexl3riVdqvxhLCW2EN8xqA4EnzX
	AHEIqYNe0I6xSIAK/KyO7xfO/nA8wt7J/UInPPnQ9GIifHaIAgcTrREFmu/fNaaX8zwOtDnERHc
	KZzV6GFV66LZghmNcRdbd/VvU+iyn40YfY7Lwmh7DICSL472NlwxO2DiFVS716M+Cmjpwp96nD+
	lfiVuAt17oKKEd1E9S21JB2IMoKASyEfNl32U0kQ/Y+leX6VRzf1fRfd8In2G8XSKcpCY78nL+3
	IVZJsaoCbI5ScK/rxw==
X-Google-Smtp-Source: AGHT+IHFkzaOXapiWN4/SxKHetf09scMUxofFapehDhsYxM6Mf+yjBALSpgOHKp7OlGFg6yNQWYZRQ==
X-Received: by 2002:a5d:5f8b:0:b0:38d:cf33:31a1 with SMTP id ffacd0b85a97d-38de92887dbmr644098f8f.23.1739294914574;
        Tue, 11 Feb 2025 09:28:34 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:28:34 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v3 4/7] platform: arm64: lenovo-yoga-c630: use the auxiliary device creation helper
Date: Tue, 11 Feb 2025 18:28:01 +0100
Message-ID: <20250211-aux-device-create-helper-v3-4-7edb50524909@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2003; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=qoSrX8iU6ZsOmDdt2vcxpMmdn8e+H5V+wLsqMb+WXTw=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq4g4/dIaY7N0MjawcCtYO6owHszhAtyjcgr7D
 3Gd3AdMv6qJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6uIOAAKCRDm/A8cN/La
 hR9uEACtV/xHFmThUeYWuRuZeLIZDjRSGPPZEm0NF1IUEyqMa+/w0GkdSU2I/GhBRDekpL969e+
 flE7DvZyypim/I0FZ9+E91BhWYhmSRaSfH/9/AKcVVKiogJILw22nAQLwHQAU4pI9XrwljjuAbt
 MSgI6Qhm5jlq1GlYCQ/hou9AbHVR9B2Oe4/YFrBkUNxEblpZLIcnrsPVO2FY5baXHpZvJ2k5CAZ
 MSpgdClj9yIkdl580XYiAPYYvwvjElVhwesa1zzt/XSJ1Idm/YRnZRAjDFe/uief6LxhKmzn8Cq
 PTKk6exeDtcsIhy2ONXg2237HCo0rho1EMRdeb/E1B5sDTqLMLKfHFYyvFYva/imfWDg260QPE8
 SB0ucc4PEGbCTcI28Hh+JdOrNP9ChRaJgfsOqR+3qLLQgWYBJ5ScIXYmp0UW91AvMrtqrwf9ySl
 UBWBVpazEhLxSaE9ItQoc2xzaUOqL71se/uZnoCaqvztP8gDdl+8GXSP2/fps5dhBhhCYQi0gi2
 n4q1VatCARnM9Gq2nM8qG9+sE/r+6AOa9faLGrXdf3ZP5y7Z1f9I1TqXigFb/dco4k7vTWAFo3Z
 /tSZVYtq1SnEy4BRJqk9nLxSPeko3sbBy6g+ly8JaELAzWpBynghDBX7iUt8qUwY3k22TI1x6Zi chvp+TE0JiJbh2Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_092836_641085_5300D81B 
X-CRM114-Status: GOOD (  12.26  )
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

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/platform/arm64/lenovo-yoga-c630.c | 42 +++----------------------------
 1 file changed, 4 insertions(+), 38 deletions(-)

diff --git a/drivers/platform/arm64/lenovo-yoga-c630.c b/drivers/platform/arm64/lenovo-yoga-c630.c
index 1f05c9a6a89d5ee146144062f5d2e36795c56639..921a93d4ea39ac54344cc964e2805e974cc7e808 100644
--- a/drivers/platform/arm64/lenovo-yoga-c630.c
+++ b/drivers/platform/arm64/lenovo-yoga-c630.c
@@ -191,50 +191,16 @@ void yoga_c630_ec_unregister_notify(struct yoga_c630_ec *ec, struct notifier_blo
 }
 EXPORT_SYMBOL_GPL(yoga_c630_ec_unregister_notify);
 
-static void yoga_c630_aux_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static void yoga_c630_aux_remove(void *data)
-{
-	struct auxiliary_device *adev = data;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
 static int yoga_c630_aux_init(struct device *parent, const char *name,
 			      struct yoga_c630_ec *ec)
 {
 	struct auxiliary_device *adev;
-	int ret;
-
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return -ENOMEM;
-
-	adev->name = name;
-	adev->id = 0;
-	adev->dev.parent = parent;
-	adev->dev.release = yoga_c630_aux_release;
-	adev->dev.platform_data = ec;
 
-	ret = auxiliary_device_init(adev);
-	if (ret) {
-		kfree(adev);
-		return ret;
-	}
-
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
+	adev = devm_auxiliary_device_create(parent, name, ec, 0);
+	if (IS_ERR(adev))
+		return PTR_ERR(adev);
 
-	return devm_add_action_or_reset(parent, yoga_c630_aux_remove, adev);
+	return 0;
 }
 
 static int yoga_c630_ec_probe(struct i2c_client *client)

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
