Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E90CA5FED
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Oct 2026 03:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iOGEY+S2BSIQ5nL0Zr40De2mgfL2WUDMK4sq+X2Qb0I=; b=JP0iweWluqMSRA
	atXSDMo/6MmGFlBIf6oJYWIcPVtxZTPDCLt1ulJB7HiSXdTot+p97QPIEx+D33kcScALHib9GA8MF
	jJ8jLKnFll9PwmW9Av0qRKBARyEcxr2TDjppvj7lcQwpXYwqZo0AIc8S2ZsYm7gVSpiNF7YiO/L3Q
	CcZLUZAccbQqGaKwUixtWXeKlfEGipnxtfMrlW8hJBeSJQk3o7YMYW9fddQGE+cWnIaJ+33NCG2Ru
	hDiz7QfWyi4Dz2behxZ8DPhRvW4mxJzEoaBNc0hHv6W93Uob4EYbU8wc6Z+XixzJ5+8v2MIzlmh/b
	VsuXNN9mLS0HVSipq0jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF18p-00000005L59-2klf;
	Fri, 09 Oct 2026 03:19:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF18o-00000005L3T-3F5I
	for linux-amlogic@bombadil.infradead.org;
	Fri, 09 Oct 2026 03:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OqJrClj0hpukmPSuCU63rfNFKhgNi2ltu4qiTIVaqY4=; b=m+V/QuhHAhvEfqO900o5/nOhCP
	KorgyQTiaMEYL24FBYgKwW/vmEJU+hf0iP9wi00xb24yOVk5VOVFXyUPBOZ479/1IOjVz3OPYd60Y
	JWhmBdYux6Tuz4Z7QsbyohbCLHGpm3I0chWVnen/wL7e26qEppE+BuLt2T/t/PWtCxPxHM2wlXCtg
	FvJkrD6obALUnx4oOyxL4LXd4LGydrEwBORU3DqNcxWG5rVen7hhvmSUvfGl7FhEwtjSKoKrso/mR
	syui7D6W0ky6XNRcEBK+mCUNUO5/EUynEqYLt4HW1zX0nak+LRc5eXi+jPV+mZNX6ILHquJwd1KdX
	HV0R5/WQ==;
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xF18k-0000000Aqrf-265J
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Oct 2026 03:19:25 +0000
X-QQ-mid: zesmtpip2t1791515878t01bec5eb
X-QQ-Originating-IP: W901LGDAxK9FnKMrdb8jn/PLHEBs5fLGm4GCmdLNebs=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:17:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 851849396968121917
EX-QQ-RecipientCnt: 29
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 09 Oct 2026 11:16:06 +0800
Subject: [PATCH v2 14/20] drm/msm/dp: Clear stale MSA colorimetry bits
MIME-Version: 1.0
Message-Id: <20261009-msm-dp-hdr10-v2-14-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 dragon@radxa.com, Xilin Wu <sophon@radxa.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160; i=sophon@radxa.com;
 h=from:subject:message-id; bh=jV+NKP5wd7+th5uGz3VcadTxsByLPMZY731XOUUipHg=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFknYlbpHZU9IvZcT795xa3Kji/MLyYxMl7neyeTkrZ3L
 79b09vZHaUsDGJcDLJiiiwK8Qxz2Stzrz0VK9WDmcPKBDKEgYtTACay/hMjw45PuU5zvq2qe/Uy
 79bKKwVlradCpi3j2NL0V0V6usbydZGMDEd95NKXPMoySZn3YPKKhcWTQlqvh3LdWTvffudd62c
 Xc1gA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MhHYuF7Otq+o/2QhaoGILUwwqASitdCe2B45+QG4zC1fXrwEhKXmmnW/
	d7qckvOvg3H3XhqhFRVLqor9tixY2lE+5kbnCka5dNPHHdUUIIvW9HB9wp6otP0FFEJIDJi
	njISww943PyIZiGUCpgUQ6FGhPFDdDxJGpf+1IoLFyfsbowj74hq6yzyA7yJvQnp/ESr6Fx
	tZCTWBth2b1/jP7LqHvQ/KTxx/fRukGjM/nN1ykuIPdZ0uMCEfgCFvBej7fiuB/s0HiKDcV
	92DEcnapLRUGbj+8bH/6nr5S4dZILSqpqac8B0hvC9Uhu9043C/X4paHnFVTcMqsGSQKKaP
	XFiJE+B7MDtZgRBsnGKZP+A7XwWJ+8tfyOoI/A5AhsnaKhjwEhsXFthJD7fuIQmVgbGYiqk
	AsxGhsHVDeATQZ8l86QcKXCQtSjkeLLslIt4Jb+Or0tUvK+c/iZKtMec7TpJEPg9aEoa2Py
	yHx0r//k9h/cp5io22OOUew9sNLdo+WxVBHBfGQa3pLL2pHWIPfIqfCzZOHzyKWxU+ZMYuJ
	zmDCwTY/y18CJwe+G41a4VxNJIg7uct5bo314tcdSLhIYWgXsGoAA+F+zfnv7sW197KmQ1c
	OTdiEyhdt0SL8busd1kp+MtdhuQRqC06JOtiZ90UhMeyZTPS2yoivCVFE+nN/mIceNZoaNz
	BljMj6+Rup5Scj+2XUl8D1kzH28VQoxy9UnTi/2H2Oykpr0WxWEiIOCurQpMtZ8zJRU9lQO
	VJLO4EldN+irpk2/HvE0lzsWV4YQjc0tvHuRGzqnTWpx+oRyN0ZJsQuQwCEwsmi9eQRisBh
	oTK7R0REYAQqh0U6gB2Tx7tuZsXGje0Y/I6fVINANeiFasoXOvw5SGnbgwtnW1z5FkGDhtp
	ZnRg52uFc8XvGFcnbAeC3nRy73QD3sF/3DRDQVXrb/QWlZ+rJ/Zm9i6OULfndXPlMkDAFRn
	FBlBQJK8nl68FIDeGJUAjtQt/yPH88ms6bryc2LN845gmg1+0zbC9UiBItHuuLamsxwWRBb
	s3+ZAZ7RSu0D9laarR0lG7CedruTQgFIXoGSzsTw==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_041923_857231_CFC45702 
X-CRM114-Status: GOOD (  10.57  )
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

The MISC0 update clears the bit-depth field but only ORs in the new
colorimetry value. Bits from the previous stream can therefore survive
when the new value clears them.

Clear the colorimetry field together with the bit-depth field before
programming the new stream.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 791bb3af2cad..783cafb22374 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -476,7 +476,8 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
 
 	/* clear bpp bits */
-	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
+	misc_val &= ~((0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT) |
+		      GENMASK(4, 1));
 	misc_val |= colorimetry_cfg << DP_MISC0_COLORIMETRY_CFG_SHIFT;
 	misc_val |= test_bits_depth << DP_MISC0_TEST_BITS_DEPTH_SHIFT;
 	/* Configure clock to synchronous mode */

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
