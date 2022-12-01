Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48D8C4321E
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 22:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QcJDgXdfd1cfBtXUiN953MDK7w0GBL7FbMwuYvO2Qrc=; b=kLckjvytGHF5T4
	XRvUaCFCR76t0OPueYXjp1D+/aCHkqrdmldi1JnGcR71vh5Pgqk3y5acqxLzUXNvfNFF9480nMz0B
	WkfwVTr/k1vNRBdo7YH1wL/+1Lc+xGJlr/8rS+U51ZtXmdIYXSyV1+3AfZLn6Ya2A44pMkeRCIudi
	C4VCMxSCl3R2BAtGxGHlxCpsPKaE6kZb90jh5atDbV5Ar6M9zF/RgSRlD6xOKbv5+ThUxLy0E9Ql0
	UFL6fJzZ3pllgxDmyGEmWGl9sJsQ8vE2N9ROFI/HHd3qGPDgO1vH2K6gdqt8uYASQRU5u+qQFXVLd
	2McM+AlobvpaCol2K0Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0s6W-00BOTU-RK; Thu, 01 Dec 2022 22:32:28 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0rxA-00BNIP-Hh; Thu, 01 Dec 2022 22:22:49 +0000
Received: by mail-ej1-x636.google.com with SMTP id td2so7590124ejc.5;
        Thu, 01 Dec 2022 14:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=43iXTOhymkFYi+I/PnHOBFe/3hsQ6zcPY1HFPaZnmCE=;
        b=AA7gdaGirrsn3n2VYahqjSR/5UUKnOeyXYZL3/QBZCSags6Fbx5mz52UAtNVA4InCf
         edmQXi2mmMMipJEePqDHVrUk4hCFHyKqkt4CgvRblHntIJ04ACcep8QwYyOUQwmhj94V
         BzZ8LX6XGXlvLg04Rldp5Mz6byKMb4TIYMbkRMRzMfK2fZ1HJcXCejS+5u+zk02s+7uS
         nh6YZUhfyeTRIGs+67jAWndAiiDv3J7Yx9f3oj7nFlERtcejAPV4wESjSEAePsbpDNlE
         OL4SeWqojn9ikb7SCJtt4VU+cGO4d2UFOUH//iS7b7B0zGYiNhRTqg5z07anWn1m7PmH
         9FGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43iXTOhymkFYi+I/PnHOBFe/3hsQ6zcPY1HFPaZnmCE=;
        b=VLOWVYuQbEelcujT802+gEZNhS+5+3wrOGUk7pjPZs6bEj9OP84qAO9HigOjzBR8DW
         TTq2WnSPi6kySwz9UJK2jtaZPguslLXdh/VvaNLqZHoxfDzJWiiUxN8cJyoTOypol/if
         qEkAjKLI+43VHDUa5eK+OZlgZSa9V3HMDw9cW7lOMTQNEfytXVyyGvoOfIU2p7guU7/f
         UsFINyczFXvqKo4crqF1wI22w1g7McvE2wD43ZFX9eLCtHq3dPfYjVLYhbpFugAGNOMi
         4wNF/wdG75EerPLVzN5etrZRfrw+KBUCjWOxZvhpYSh0MhC+x8O3ZIgg/0j9kHQs/0t2
         RGqA==
X-Gm-Message-State: ANoB5pl9rSUFXAnDUeJtqEho8X2E+fFvccRnclG8T214LSOsdri5kQxa
	7vbFt+Z+bGLLZvMXDDA0F5UlwZXdrJsS0jfjmt8IGP/JAeo=
X-Google-Smtp-Source: AA0mqf47JtVd8xCV1Di9WxT5/mZR1O5eoQCsz4gXAgvql2Da0VICEr1QZE6Pkh83nNHDWXkA0C0hrr4SM+v7cZErJso=
X-Received: by 2002:a17:906:179b:b0:7c0:ae1c:3eb7 with SMTP id
 t27-20020a170906179b00b007c0ae1c3eb7mr4545268eje.510.1669933364900; Thu, 01
 Dec 2022 14:22:44 -0800 (PST)
MIME-Version: 1.0
References: <20221201103026.53234-1-tomeu.vizoso@collabora.com> <20221201103026.53234-3-tomeu.vizoso@collabora.com>
In-Reply-To: <20221201103026.53234-3-tomeu.vizoso@collabora.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 1 Dec 2022 23:22:34 +0100
Message-ID: <CAFBinCD+UWsky=u8FVqEb+nrhgXVXyEJ4=GMdaPZ024s9w-HcA@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: power: Add G12A NNA power domain
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: italonicola@collabora.com, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_142248_604602_4248B8F1 
X-CRM114-Status: UNSURE (   7.36  )
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

On Thu, Dec 1, 2022 at 11:30 AM Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
>
> Add define for the NNA power domain for the NPU in the G12A.
>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
