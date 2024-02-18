Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE0BC48BF6
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Feb 2024 17:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SJQTeyOninfT6fomNAIFgtvGpgkaw5CdMPNmQ7d6oxg=; b=HX5W8gyEAp+phN
	OGE5y6m7B6rQgwGTklMHs7t4Pv/aaVTvubKzUl8IUAfCtewsl5MDJhSzedExKZ1XuWAA2g/K6FLhX
	pzvPNYO/ayBLFVH/GfG2hZUOQXcluirlj8n3YDQWRVxtu0YW0Z9p6T6petM/vBZPliSK9O5F/sDrg
	63Fza1k1DYM5VTjrwr57L8IHwrdXQbM5Fp4gfgooRCfTQJ37XZ3oRObm8JkTx6Zj63PLLzZXX4kZu
	Gj4tupce6CdLQI8/Dxl8vlkCu0W+J1SX1njwgiNyhLL4aGp9g/XEVlhisRxHN2T6ERei02HySSkME
	M4pvZKdzo5k77Q15cJhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbl1O-000000086lr-0CO5;
	Sun, 18 Feb 2024 17:32:10 +0000
Received: from mail-bn1nam02olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2c07::801] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbl1K-000000086kF-47JV
	for linux-amlogic@lists.infradead.org;
	Sun, 18 Feb 2024 17:32:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3+IpX0OjDC2zN60RBJ/YK1irxjvNSfiki3HbGk676HRbEPqxcVseRjPHeX8P/3VW+xupr087rjvEKvgUhjNKofwp3cTC3Bj/LGyg9yzfN/R0eXDKo2VoujiU+Gqz9G98uJc1krEIamzhdNQfmfQHIZqMdNFHSyS8Pd1mZIGuQgId6Q4ONXGY1IfKurWzwEjluVxJ6GRDuNrlceEnssCjAA9BGIBrpVGW4k0s5GLa/x5RbDnmaMrvtrRTQ8eCmrgtad+CaBPVxhWhkeG8hm5+r9Lkhc+N9s14Ie94aG8lQThyz4vy9x8qnMTaf+hmlG9EDFZ1yBrGVUKij6k2v9SxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qd0NHIFD+sJ7FC4Az9dm4PjB4N1yseNsedU2cc+qziw=;
 b=iohLAqLUvQK/2eHKtuWZPXK6yvc8s8BYUTgeSFcLo7WC26TWgnGtZusAc2TTTWMPcecPV47KFYicKmTXgStsw+0GannfisZ/1hpnmyRecRhZu/tsyDEpfeYpOvT9KjnengspNBzX4ztE0/NvWhsS0mV3gOQbwZfvCYNPLiWygV+eOWT1mWsxbzfTrXzesjU7WuQHKQPZ8XLRTitFQ4HqoiCkRz5lwryo46NZrpjaihpFskOmXSp9RWo4H46N2K8nEFpI36z8ucV09rcx2w5WNMHCrB8B3oQPl0lam6DyS9Ona1U91vZE6s2fxQNrIwsmdvr9RipM8SxGAInuFmxSwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qd0NHIFD+sJ7FC4Az9dm4PjB4N1yseNsedU2cc+qziw=;
 b=uc3wM6AMtnBF1DBPQskYB3ThFG8jPaRuBMOVdsRVoSNhs02rUtC8aDFacihlpVEi7mJXZHAejZzP966tzJGqsbeEI5EIGBKrbFOruIPWnBOAC7nYYTiCvGOd3D7rwUY97kDOO1IbipXqW/48vj7x8L+t8wvw1UEnWAqUydUZQ/zu06aPqXG7FByG2c2xCh2MKv8siJbDbSqLpXxytS8dIWV25ykYYNPIXsbP48rPxTaPCO4+y/R93VHPt3sHwECTTjssmnApYYo30vg5lfkVWq8NYIMTry1KZjV4OLz7uiIJtTOYVaxxwSKAVj0OwIxx/IpP1Qwy2xgUc4KsY7OJrA==
Received: from SJ0PR20MB6128.namprd20.prod.outlook.com (2603:10b6:a03:4ef::14)
 by BN0PR20MB3958.namprd20.prod.outlook.com (2603:10b6:408:12b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.32; Sun, 18 Feb
 2024 17:16:14 +0000
Received: from SJ0PR20MB6128.namprd20.prod.outlook.com
 ([fe80::20be:4f49:6e2d:fe89]) by SJ0PR20MB6128.namprd20.prod.outlook.com
 ([fe80::20be:4f49:6e2d:fe89%4]) with mapi id 15.20.7292.033; Sun, 18 Feb 2024
 17:16:14 +0000
From: Steve Morvai <stevemorvai@hotmail.com>
To: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: RE: [PATCH] drm/meson: Don't remove bridges which are created by
 other drivers
Thread-Topic: [PATCH] drm/meson: Don't remove bridges which are created by
 other drivers
Thread-Index: AQHaYFsLLO3SRq93xUW8TY9DWkPvhLEQWmmr
Date: Sun, 18 Feb 2024 17:16:14 +0000
Message-ID: <SJ0PR20MB6128970D34CD2AAF3D8E06F9B0522@SJ0PR20MB6128.namprd20.prod.outlook.com>
References: <20240215220442.1343152-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20240215220442.1343152-1-martin.blumenstingl@googlemail.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [UINJutI9cznssY3wn59YqNQWTHN/EjHfaaiurNZ0JvNuoS1cI5X3eIBsb78MFqsK]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR20MB6128:EE_|BN0PR20MB3958:EE_
x-ms-office365-filtering-correlation-id: 2e38f5f1-e343-4a35-a9ef-08dc30a54f8f
x-ms-exchange-slblob-mailprops: Cq7lScuPrnohOpWPhDEjUlBDsSugqNy5WZBx5vI1RREUfO00A5alkLDyO05Lm3w99ZXv07BWnga0Fy9gcTDo4TwUftHisk+T+TUCPhcNjSqT6NN6Vu9ssMPGnKCziaO5kKc5O8ryRR2TM1sCqe31moMdgzMjQtmF4Xwy5x6wREKy+hHkDwt2TV0KWs9CRetB7JMzanQoQ4QI7lc2pOcWHYUbNY5/FosDC0EXsOZGCrwelYQZHQpNHrWIQQILYi3ujmt5ftObyFMmcUADZZWUSshMbbWTTB7yFR7Zg595M8JQzLftjQPMQ5bCjZxIZ2HqS7uEMPtLfarsTYbrRby2IK9S1yBKQ7BbrDCgStqI5DYGZHsl5ikxLYlu8kfLM1GD9fTNWd5GjWDHCENgLwVTdQECioqpIRB6ySh+0WVkKxVk6fgesX4oN19yHZuDzuURxY3Jntd0eiNy2sAXH/2IbuiH5vT1wO6GWnfbEd9MoRwhoNQsQ1sVtgMLGyN+MUMcKp+bwmy/DJFPfPHIRJxgLx4i91Ztyl8CZFQyNqze1FzSwSavCeA6BFGd4W51QW3WTVvXjqV3gFsNLZukRUZCmQoBGNvLuEC+gKTmq+i9rKIxJRJG4mob8E0vY1eUOSLP4lrp5XHzpGVqf3MKIZFKzIDxCZaalBrAwVyAOwonGGWBtwkvKI09WzcRhSqTZoRTExwWyWNIZzzYdxTLAGTtEN62pgLW8Sqsau0xZJS1PuNqA9TNHXJ3fJyBW5SNkTR708eAFYPkkck=
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OcSxfytjEqanrbST0P4WJFPyhWeKAjvEwRZFYF26ZX/lv6NVGVEio9FNUN5zGEefO9TWLaWxzDfplgJcvZ0Bc90HNhpE4P0H9HuOzNVQ6TJm0mc1DPuTUSuEZOYILjmvk1biwJ8xR63ZxchcSUlx2CDcdrEvJNWYoJlJGDq+ep/TlFPE5rMO4fTv+pTrXizUUPggzKIx6gCnju9rvU0SAU25CeR17wTma2f9OCp/fn98yo7GKST6VF2ZWt0pG+yaFm5Ard4ARNcNwmKlmvpjFNWZWIbpPvl/i+hAKaMjDaVI5q/IfQ6KVElzvyPcVoQiSb/QL2Lg9JLVT0Yq4MiqUMGp3WqrJ7uyRDbHtpu+mInNCe83D/xzMKqSk8hi2eswn2IpJa9Bl2w2x8TEiSPc8T2BVGM/idxq6A4FWYBMuB43+lVk6dgfPgGfFeKhtFfYKJaLBJEnl15EwmY+DhFTEozhqoCl7TX/F/s8FIBkJS+w8UG/viCp5zY5+vOFaSrh1a7KBEt6uz1R8tc0h3WvHtoZ5GSoYdjRVxGtjQLwDy3Xpbauh7m6+cOB98JAm7MT
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?t7YYLzqopgsrZWdKmN8KnApsEtWco921NtnJJubK/y0+Kt7jSqm7+/i7wybg?=
 =?us-ascii?Q?iqd1FmQ8PMZaFXS3/MMnqcj1lfv9+rKrvyfT3IQ5Dp7VVy59//29Gp1VcZxr?=
 =?us-ascii?Q?sXFRyvuJ3D5QZVPJ83reADh9xuUCt+j4uahLJ6uCpZlj0XZ/GQGj8q/9H3fJ?=
 =?us-ascii?Q?GTkf9TFO8Tdoa4UvcsBoxxIhq5EOU3XUHoybmgWP7qG5kw/ap+8HvdCmhoQm?=
 =?us-ascii?Q?m4ZNsjF3s1ddTzfPotNBnxYBeBh7eV1sl0GQQwjOrmewuNoKJ54YcLkjlOVB?=
 =?us-ascii?Q?1IRaICO8zv++pMgLZBiTuW2ju/GMFCnZ5YNAXjPIp3jC/eV2GNrT3Jav0DgK?=
 =?us-ascii?Q?2TvKfneII1+vR54QKMjgHfsOFSyCwWLQnlDvDWilhj8MZqp6FRY/4UO5JW7H?=
 =?us-ascii?Q?2M8DThKE4SwAVD4EsPIlZIQ8ism9CHiVJ8jcP6nPJELSLq1yrFsATsbo9PZV?=
 =?us-ascii?Q?f/iO2kEh+Ju6NwSoYoEmG9cZf3B+nVDu2fPk6v5T4sTMQ5WFpy3HwMYb5vmH?=
 =?us-ascii?Q?XXh4IcfZ1SktTXRjKGigc++1/yg9mdP78zJFdOE0kcMcsBYTk3/jHYxPeK2H?=
 =?us-ascii?Q?T3YMNDSG6Xzi/8Ip4vXVkDoklTjGE1zNVIDd7F/XxJWXnTL4wGbjrzJodc26?=
 =?us-ascii?Q?aL4CEzED8UdaK2STGKQ4QfAoEBZX1WtNmt/Tq6DtqoeE91ANMfO+G1dPBdQY?=
 =?us-ascii?Q?wJxckzAvL7MylKsjB6/sVY/4zWd2yALqQQgKl3/SKYlqbyEoz+j8D6+44368?=
 =?us-ascii?Q?7o/XdnJ155xQrejsaZoCl60Ix86Z2c9LBIuGvSBJobb5WWtZ0uxPWh0pcAla?=
 =?us-ascii?Q?TDY9/liX+z2uOUtOWYyCZ6Okc13EJM5xYeqX0v6rZer6dI2WsAiosPIDi4dl?=
 =?us-ascii?Q?fhWmfyvZSr57orZIJS+hsMaS3ItSlwaS8ev5ifWMAA19VP8iJydvl929sV3G?=
 =?us-ascii?Q?C1xs7jLHMo5VX3F3v9t+oRB0jItLLJWVFCQ/ZbPw2sa7jWltj3l43q0R6azW?=
 =?us-ascii?Q?DQKpW0SqQFZdmjevVFi4ROSdEMKE2L9JpftNo/Rjiaqzc1BQ0n41hgtFOU4g?=
 =?us-ascii?Q?CdbPIEQU3cP/URHNELXXmZjPcXXwyJAzFTDuQcCpxamJFArxQQhQlWAZ5aDL?=
 =?us-ascii?Q?FBCrSG5n+bWa6/bnuTfXVpC21zp6ZD+b8oBuS2sSdpKNMSZrtlnmLxH3nfO6?=
 =?us-ascii?Q?JfP/hgT7UlP+7PY7VFE01r43Wp2N+4XBSp/U1E+Pf8sWlsiRG+O5e/uXDpgu?=
 =?us-ascii?Q?0TbKQkrzEJyrGIdcTpni9AZLjiopb0D+fmJqz4CWYJ3sPxW6xFaYWHnUCHyR?=
 =?us-ascii?Q?taQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-9803a.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR20MB6128.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e38f5f1-e343-4a35-a9ef-08dc30a54f8f
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2024 17:16:14.1759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR20MB3958
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_093207_041052_0C1B46F8 
X-CRM114-Status: GOOD (  14.46  )
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

Tested-by: Steve Morvai <stevemorvai@hotmail.com>

Just to confirm that the correction addresses the failure of the HDMI initialization issue as reported. Thanks.
________________________________________
From: Martin Blumenstingl [martin.blumenstingl@googlemail.com]
Sent: February 15, 2024 5:04 PM
To: linux-amlogic@lists.infradead.org; dri-devel@lists.freedesktop.org
Cc: neil.armstrong@linaro.org; maarten.lankhorst@linux.intel.com; mripard@kernel.org; tzimmermann@suse.de; airlied@gmail.com; daniel@ffwll.ch; khilman@baylibre.com; jbrunet@baylibre.com; adrian.larumbe@collabora.com; linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Martin Blumenstingl; stable@vger.kernel.org; Steve Morvai
Subject: [PATCH] drm/meson: Don't remove bridges which are created by other drivers

Stop calling drm_bridge_remove() for bridges allocated/managed by other
drivers in the remove paths of meson_encoder_{cvbs,dsi,hdmi}.
drm_bridge_remove() unregisters the bridge so it cannot be used
anymore. Doing so for bridges we don't own can lead to the video
pipeline not being able to come up after -EPROBE_DEFER of the VPU
because we're unregistering a bridge that's managed by another driver.
The other driver doesn't know that we have unregistered it's bridge
and on subsequent .probe() we're not able to find those bridges anymore
(since nobody re-creates them).

This fixes probe errors on Meson8b boards with the CVBS outputs enabled.

Fixes: 09847723c12f ("drm/meson: remove drm bridges at aggregate driver unbind time")
Fixes: 42dcf15f901c ("drm/meson: add DSI encoder")
Cc: stable@vger.kernel.org
Reported-by: Steve Morvai <stevemorvai@hotmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
This issue was reported by Steve off-list to me (thanks again for your
patience and sorry it took so long)!
The Meson8b VPU driver is not upstream, but the problematic code is.
Meaning: This issue can also appear on SoCs which are supported
upstream if the meson DRM driver probe has to be re-tried (with
-EPROBE_DEFER). That's why I chose to Cc the stable list.


 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 1 -
 drivers/gpu/drm/meson/meson_encoder_dsi.c  | 1 -
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index 3f73b211fa8e..3407450435e2 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -294,6 +294,5 @@ void meson_encoder_cvbs_remove(struct meson_drm *priv)
        if (priv->encoders[MESON_ENC_CVBS]) {
                meson_encoder_cvbs = priv->encoders[MESON_ENC_CVBS];
                drm_bridge_remove(&meson_encoder_cvbs->bridge);
-               drm_bridge_remove(meson_encoder_cvbs->next_bridge);
        }
 }
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 3f93c70488ca..311b91630fbe 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -168,6 +168,5 @@ void meson_encoder_dsi_remove(struct meson_drm *priv)
        if (priv->encoders[MESON_ENC_DSI]) {
                meson_encoder_dsi = priv->encoders[MESON_ENC_DSI];
                drm_bridge_remove(&meson_encoder_dsi->bridge);
-               drm_bridge_remove(meson_encoder_dsi->next_bridge);
        }
 }
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 25ea76558690..c4686568c9ca 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -474,6 +474,5 @@ void meson_encoder_hdmi_remove(struct meson_drm *priv)
        if (priv->encoders[MESON_ENC_HDMI]) {
                meson_encoder_hdmi = priv->encoders[MESON_ENC_HDMI];
                drm_bridge_remove(&meson_encoder_hdmi->bridge);
-               drm_bridge_remove(meson_encoder_hdmi->next_bridge);
        }
 }
--
2.43.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
