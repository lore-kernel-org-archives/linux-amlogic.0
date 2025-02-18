Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA14C021AA
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Feb 2025 20:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Xdd9TcFG6YBi8YI9gmOpRhXOZY6sO/hIjd4tL4s1AM=; b=DQb8BkA9G0ujyQ
	HrFJOWko7CIhlJQ9abUgVv7eqJkAJeoPonh/Sr8zMkSrrsDENXzRZRIqJ7Vqr7rDGbjpo8RL3/OA/
	nxAwR3PtZCdZIlO+/1Xtphip4+stazjK+Oo9WgNU3FkvlbrkTqFFke5sZKW0fMqWblxu3Eyn5kPWs
	uyrVSMZLOwxaebXlzbtjyqEm2spX30KxWMujxU9JG1195V436kLhFEL/vfOcJck1NjFpqP6Nkt6Cl
	SFkghdsCzkAneAwSE/nakAHS7GGeLLb9nAI2mkK1LmkEplXqMDtm8Lnf/MaOxbsjxQXiDVpJl/ZsL
	/fzNCA2WGLIS2bj9yriw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTwf-00000009i1x-4B4y;
	Tue, 18 Feb 2025 20:11:53 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTIp-00000009a4a-43s7
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Feb 2025 19:30:46 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e04cb346eeso5574077a12.2
        for <linux-amlogic@lists.infradead.org>; Tue, 18 Feb 2025 11:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907042; x=1740511842; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIVOEcwBRHvFCUubXKAVFbf42uXe9rpQsZU+xYDLrc4=;
        b=TbX5n3BEWXbn4Mr95wwKc1ffyosBARFHlYYkuMcfK4X2PDp3R/uBnYLuk5GzBntCzY
         MGxFGpqR/auwLhTYH1yZn/KlLKhBdYdiTXJjIjGm/V/7LlnUdD0UfbLfzcfHQKN43end
         qvhy20EcN5Z4ixPR87KBjCiw/kGrBgZtf7m4trGzraQCa906jKXaxOHiJcK06MMmjbz/
         PRTvJ87oxoyubKoN281K47tMLobPzEtFxltdlUNLWJ/0ZicnTUk4n+bOOce+lHIIr6yw
         hFKPc/tDv7bH0FsoQUkBo7yso8u12/O2DXAfk9A8+z2fLrnqU0SdfGp9pqbHk11FHCHh
         10xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907042; x=1740511842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIVOEcwBRHvFCUubXKAVFbf42uXe9rpQsZU+xYDLrc4=;
        b=RBbLi91sw7prn6HlcrpjRLfSgcKIJzc0lso+QWJxuTX4leS+CH2GQWnTUeak/fQdGT
         5u9S848t8NceZH1XQUJdGl4wTTN+lR4P6wCNJsv1wCpTNUZ+u+MzQSevDm2zen7AGEAM
         83alOu2Nv1czLbYn66MN6/MfETcn/Cx424ksCSlVx4ETkw9TTA8GzsobbldhQ5i3d/9o
         J9qJmaWi0YhaUUqbAys34AndkLTM3r4Kiu8/ndSnRfFW9qGpAeQvLjucOsvaGVtjT288
         Y23PJRmhsa57KbTnPd17ztyxk0xX/Er95hKsDUGvp/IX0p2QzkiVpkkGcnkgy0lj4UhD
         xGMw==
X-Forwarded-Encrypted: i=1; AJvYcCUAn3noxyA3ZVc04mCaSdYsNkVtxqFthfK0+qRxwTg5eAJ/iKsHcCXBjTEdthGOV6r5s3yPz6SGFBSSw7x6@lists.infradead.org
X-Gm-Message-State: AOJu0YwPEaJEtwT/J0FN11BJDG6sEy2ol4buA3gFtyrCFTdENzV1sHB0
	F1NhQ3dxx6ENmC25obm+cJWKaTkkLF091XkBQ2gaTCwf6UuvtulrLiXOOBThngY=
X-Gm-Gg: ASbGncv24RcSOeSvh3hyhKneuOfH0CDfGBC/QwVAw5QyN5O18RTlcWrYpPB8VQmV5vH
	m1knO54RZqZRcMPgZ1TWqvspeeSMe7AZeySChU3MqX5qcjK9soDUeQKYdV1zFgXvk34ZYByxDqr
	LcsnQmdPI4h0mxJL6umyXBPWx2+zCbbPdeGoj2cU5ZV2FSeIxr47QSQdVxZq6E6KsqGuia/X9+i
	35PIvgE6B20pL0/D5btmRdRd0MZeQn7K2w6WxNkPTqML6VIq+DKcE1SkMsYleHGFJ2jeskb9kxQ
	tnGUt/NCu4IsLHOhicJAVZ8VObyL
X-Google-Smtp-Source: AGHT+IEaDlkCpMhhf2+mkMM5/OKTB8EFYwX98r88Q56bEpDWJea+Vb3RIYNYnlJJ1n7KeB3rfmfZsA==
X-Received: by 2002:a05:6402:13ce:b0:5e0:4a92:6b45 with SMTP id 4fb4d7f45d1cf-5e04a926cd7mr12713802a12.24.1739907042130;
        Tue, 18 Feb 2025 11:30:42 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:30:41 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Feb 2025 20:29:48 +0100
Subject: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
MIME-Version: 1.0
Message-Id: <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2486; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=KuxNBMyQg1p3DhiqEXTbWghcfYRAG9Z13aki2rWrd7s=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/R9RdbIU/LlFZOD+5ye18+mV/JIVvHg59Fc
 N2QSzq7j3+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7Tf0QAKCRDm/A8cN/La
 hRT2D/9/+3m2izVFqHA9JNo66E9ppsPmq0HJSfSk8sVMTrgr6uyqpbKEpE6M6rPkiSX8366n+TD
 eCRkzB1L3/KYyK0Hb6qwNlKpqho+iKWAdXZV44t38LU4jLxy5upDUo9DvKN6ShNzojjGOTQLiUX
 0dP3xRvTlmnWLLr7cA75tOMTQzeMB4gX7ih7W7tsoc/5NyUZdYD1S6cQQMgskakyzZ4OSljy+1B
 urNGbxB+IGwSOEFGYqdRSUOC/bnk/G0Z8X05CINtg4TtcsyIBYA+vhcXrq8X7AXN+iukU8H7SLE
 XHUZl1EYgw1vcvyHPr0WaDPa6aP95wEZ8wLfGy/5xrWMdj9GFyWxILnDhvTipioT9+dSCjiwmRt
 w+sfi529OC67DfLep6PkVbY/1YyDl0NnfnGQjgIywgZ5lzCsOgmUtp3Yk5akbxJGwpC4qMyVH4Z
 VVqymYHalMIVWz01kgnbtplKww8u2ruISe4cz3VZDGxFEGf4oLHk+Ea9NwfdHyVGrOmjzKg2IPg
 ADyUwJ+eeALG/5zj8sK1Eo/GJ/P0kNStexXzQl5ui9MPUg8W4MvzbanzCj9sa8P7Hr/MZGIJ8iS
 ZKQjcj23BRTg2WVCsVgQlo7jSvCh8UYIz+56p2VIel0C3mW7uiq28FLbIqplEtAykScvdKcavs+
 l59DWERCtvYZUPg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_113044_003429_0F4EA284 
X-CRM114-Status: GOOD (  12.35  )
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
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++------------------------------
 1 file changed, 7 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 205bd0fde4f8b3400caa8507092308e50eb172b7..38bd18b14887a27a716c8798f6284649c77a761b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -457,23 +457,6 @@ static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
  * Auxiliary Devices (*not* AUX)
  */
 
-static void ti_sn65dsi86_uninit_aux(void *data)
-{
-	auxiliary_device_uninit(data);
-}
-
-static void ti_sn65dsi86_delete_aux(void *data)
-{
-	auxiliary_device_delete(data);
-}
-
-static void ti_sn65dsi86_aux_device_release(struct device *dev)
-{
-	struct auxiliary_device *aux = container_of(dev, struct auxiliary_device, dev);
-
-	kfree(aux);
-}
-
 static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
 				       struct auxiliary_device **aux_out,
 				       const char *name)
@@ -481,34 +464,16 @@ static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
 	struct device *dev = pdata->dev;
 	const struct i2c_client *client = to_i2c_client(dev);
 	struct auxiliary_device *aux;
-	int ret;
+	int id;
 
-	aux = kzalloc(sizeof(*aux), GFP_KERNEL);
+	id = (client->adapter->nr << 10) | client->addr;
+	aux = __devm_auxiliary_device_create(dev, KBUILD_MODNAME, name,
+					     NULL, id);
 	if (!aux)
-		return -ENOMEM;
-
-	aux->name = name;
-	aux->id = (client->adapter->nr << 10) | client->addr;
-	aux->dev.parent = dev;
-	aux->dev.release = ti_sn65dsi86_aux_device_release;
-	device_set_of_node_from_dev(&aux->dev, dev);
-	ret = auxiliary_device_init(aux);
-	if (ret) {
-		kfree(aux);
-		return ret;
-	}
-	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_uninit_aux, aux);
-	if (ret)
-		return ret;
-
-	ret = auxiliary_device_add(aux);
-	if (ret)
-		return ret;
-	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_delete_aux, aux);
-	if (!ret)
-		*aux_out = aux;
+		return -ENODEV;
 
-	return ret;
+	*aux_out = aux;
+	return 0;
 }
 
 /* -----------------------------------------------------------------------------

-- 
2.47.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
