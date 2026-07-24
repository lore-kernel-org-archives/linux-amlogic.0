Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE6CC531C9
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Jul 2026 10:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:References:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQMlCpyakWiqWAikP+9BWidG9Y7uMx/d2tFPNpNYgVw=; b=OQrF6keypE7dP+G0f1m9lNwDiM
	omDBjE4jDk95zI4/f2kKTWlPf1ZF6jC0MdVdOPKfrHR5yqQD7vx89dabBAoFRdZWXflyb92oC9fM+
	SnbDtzc2o1lG1Ywzj8RLFis/zv+kTcRZ9xZcOKsZejLV/bq/yJH8g2GC5cD8MgKVpoA5zWVL1u0yB
	qzDKG7BIdXxPBOoRLdabTJTuX2ruRFEqBBjYza9gkOBD8TaojVnWpXz45dix3vX2zDQD8PaWdrpSY
	Ie6IRomvfpdoMJicucC01+MbxYg65AOu5neM/lE5tiH3FUoJZ/+rDT1vJUtW+Lk8Txgyy5NVPBKJ8
	2YCXbyDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnD3x-0000000G6Ig-0uXl;
	Fri, 24 Jul 2026 10:23:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnD3j-0000000G67i-0I3q
	for linux-amlogic@bombadil.infradead.org;
	Fri, 24 Jul 2026 10:23:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:In-Reply-To:References:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GVhVYNeSMyFFMXB09bCc3cSDgOhTTCeaRWg3rWJ0U+M=; b=IdOjozK9LWIKQv/5DwIezjZ3uE
	2dgDlViyE7gxrzBBfHXgeBIsNkGY5Ys38HymfGWb6fSslFLKEMqelZA99hWuL/1kbg96vA1nNhVIm
	oK5lxDOvJNqTrLqJ8rd79JN0V94fBFttOZXQd3P38XZ6A0u4S0WE/VlIVTyhR05ueN2zi4Zsvtick
	1PhwVenu8c0zYbsVFxI+QNfLP4gbLxpas8jpXYZ/iBeyT63gnT5pF+SF3R26d6YUi89+Qt2OEw+sU
	tmEKtZQcp1w/xkIxDiLEj1/khcfcEQvGRIjaCjbIva2tHCbLVrRPZ4jFkymwD6+p4vi5ApO7rsrkB
	KPtI/fQw==;
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wnD3a-00000002SdK-3vAw
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Jul 2026 10:23:13 +0000
Date: Fri, 24 Jul 2026 10:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1784888580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GVhVYNeSMyFFMXB09bCc3cSDgOhTTCeaRWg3rWJ0U+M=;
	b=IZ4i7/idp6y3oteFX+MItw3b6Shtpkq2WCfKLx4IRdDGWY4W4O8XWIrEO65Fqbjvy1wCl2
	nW8ifgPytr3eY1Yw1mpmscEoKpe48lUx9IxRJ7JfWFNI53zZdzo55voXZgzmMIYaHczuBC
	A4wA2GSfirwI00CN8+WgWxbdXHGaFWOuFoY9Fx0tz2EaHdwz2drjFZfg0zTT1211IC6TBH
	F6Rmop7WUQK4uN/v+eZ/9c9lhfxbixR1ZgSG0dn7TnGx6ZE99NFY5ODecgf43zcMO5jjbO
	q6a3FnSlzcaamfLV9UreCIniGLrTExAO1gCHkbKx7S4KVKql3k9CvPD9nt5yMw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, zhentao.guo@amlogic.com, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
Subject: Re: [PATCH v6 2/6] firmware: meson: sm: video firmware loading via secure monitor
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com> <20260724-b4-s4-vdec-upstream-v6-2-6072a7ee7428@amlogic.com>
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-2-6072a7ee7428@amlogic.com>
Message-ID: <tiocu5.1w1r6qwzlmu6q@postmarketos.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_112307_131988_926A575F 
X-CRM114-Status: UNSURE (   7.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Zhentao,

On Fri, 24 Jul 2026 07:04, Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org> wrote:
>From: Zhentao Guo <zhentao.guo@amlogic.com>
>
>Add SM_LOAD_VIDEO_FW to the secure monitor command enum
>to allow decoder drivers to load firmware through the meson_sm
>interface.
>
>Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>---
> include/linux/firmware/meson/meson_sm.h | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
>index 3ebc2bd9a976..3b90b49d0552 100644
>--- a/include/linux/firmware/meson/meson_sm.h
>+++ b/include/linux/firmware/meson/meson_sm.h
>@@ -15,6 +15,7 @@ enum {
> 	SM_THERMAL_CALIB_READ,
> 	SM_A1_PWRC_SET,
> 	SM_A1_PWRC_GET,
>+	SM_LOAD_VIDEO_FW,
> };
>

I would include this in patch 1/6.

> struct meson_sm_firmware;
>
>-- 
>2.42.0
>
>
>
>_______________________________________________
>linux-amlogic mailing list
>linux-amlogic@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-amlogic

Best regards,
Ferass

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
