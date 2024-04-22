Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF22DC10F15
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Apr 2024 08:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4pJun3i0JsHb2eKuE9arkvZiA+Hhh2ZQ8n1zK1KYh38=; b=VWYW6zhGcXum02
	m63OTQYUidxSw9vLxxgpA/BDDFxvClcs30eKswlS1xEdMCqEESZanLm3EEjbCPUkCf66Ep0mUk608
	Ql7kgwmR006KbvS0Ey82QNwzoxtC4FZHxWeml5a6Trnf7atPMNPCjGuA/FwZ+btEpIcwpUgI64O2v
	7X5Jjzb+Xchz7g16jIpEHeVAqpdlSJ83hdy7axF413KxwvQNKpr/4FENYwyIOYLz5EUpDn02UY7qG
	lPC5n2OL9MqXBS5O9GUHnMBcGcDybZldpRvfwxbB4i7sH9Jbqljl/IV6Z5Vftk6wtbvpDJ7SQCKKX
	YaQj21nl/PdOh8m7mOTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryonp-0000000Caa9-1lMJ;
	Mon, 22 Apr 2024 08:13:29 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryonn-0000000CaXn-0cPa
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Apr 2024 08:13:28 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-41a7ae25d53so1945875e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 22 Apr 2024 01:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713773605; x=1714378405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SS3mxjJZGylPMQWrV6fjHJvytyShfSYEN+VKk+SCWTk=;
        b=U2WdO0ZTc2pyXWjO05IhobSLBzTKwTpRcX3u1QSU5YOqf9yZWG+FxYddNEz5hH1634
         IzQPfEKu0uxUoSqxpan/J+M1uvaI6uyrc3Qj4JYbB1s27yDx73F0t/x+kGG3b/E/FZBV
         AgPdWa/ezhr8T4BPSEGRaPEErvIm1s5/vNpKtnjjdkvT1Fcf/MceJ4rMQ1rOfEv8Cc+Z
         Ifl+W7Vq+9rOe71rDQysiF7Ytpt7fsE2TwFwJFGD4WGUp818ESmSEpTKEN8Onh4dBlci
         LMtpH1L9VsCUXgMWaYHIU8w1KdfyatREF0sIknhiNVjlUhRo7tUo11UYs5iIuUpdxARl
         cjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713773605; x=1714378405;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SS3mxjJZGylPMQWrV6fjHJvytyShfSYEN+VKk+SCWTk=;
        b=iKGDyDDj1PbqLbaBGBXF34GkaVh4WUo1/w1dog8ScOhLbpLqRLHXZxjzqPwNtMqqMr
         4pX0uJkmQT36qyh3F/L5QjzrOi2YgGUtFjyp4500qqWFd7CxlbsmCu4CBKJ1RQorr8Yx
         AbTKp2OSdVofwQ0Y4VcvCa+QcAJ6ygHDSHFCXHMy53DvsN6fdo4VdOfXj1a/+4TTrIdG
         KtTImAzeZWgbKbWjptcG6ufdCFZWZzEbs2gpJBbXPRHg0l71FDORPTfzVyFNY5EzkONl
         EN3PZtptkPkB1c8nd5AxBDYXfeGI1D8fSIbSbpj0h1HGvZzUNcEaiZ9Q/kSWsHb3kB9f
         +7fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPSC4E0dV10y7Eq2JDR9HuIcPesyjgaJsnk5mVY8YsG8NhKpuwq+d5F1JePLkgu19w2W/WjpqkJ84JPYHViMBFGiEu+bFF8tW2kSW50s1HDrk=
X-Gm-Message-State: AOJu0YyiPWAN8leZvMDlrS+hNfV/7DlGLwb71N2GN4xfFz6qI/eadJjH
	lKmHoKSciWX3BfRMEC1KYWXYBJEnBdab23iWFJi89eEzGwLiWbZdNUfvhh7XLE26z31M18wbfQf
	cUsaD2Q==
X-Google-Smtp-Source: AGHT+IGPrO7v5/lKn4DROPvyQytV03lXmW3pR62NbGJT8AmgPph9yPGqucSHM/Ijoe+qpMFYe5TATA==
X-Received: by 2002:a05:600c:1394:b0:418:e6a1:c0e8 with SMTP id u20-20020a05600c139400b00418e6a1c0e8mr5978703wmf.7.1713773604900;
        Mon, 22 Apr 2024 01:13:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c35c700b0041638a085d3sm19437504wmq.15.2024.04.22.01.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 01:13:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 Jacobe Zang <jacobe.zang@wesion.com>
Cc: nick@khadas.com, linux-amlogic@lists.infradead.org, 
 quic_jesszhan@quicinc.com, sam@ravnborg.org, thierry.reding@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240415031408.8150-1-jacobe.zang@wesion.com>
References: <20240415031408.8150-1-jacobe.zang@wesion.com>
Subject: Re: [PATCH v2 0/2] drm/panel: add Khadas TS050 V2 panel support
Message-Id: <171377360401.3418456.5122435310463743780.b4-ty@linaro.org>
Date: Mon, 22 Apr 2024 10:13:24 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_011327_240438_EFD4E76D 
X-CRM114-Status: UNSURE (   6.69  )
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

On Mon, 15 Apr 2024 11:14:06 +0800, Jacobe Zang wrote:
> Changes from v1 at [1]:
> - Fix name from "newts050" to "ts050v2"
> - Add specific description about controller change
> 
> [1]https://patchwork.kernel.org/project/linux-amlogic/list/?series=842707
> 
> Jacobe Zang (2):
>   dt-bindings: panel-simple-dsi: add Khadas TS050 V2 panel bindings
>   drm/panel: add Khadas TS050 V2 panel support
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: panel-simple-dsi: add Khadas TS050 V2 panel bindings
      (no commit info)
[2/2] drm/panel: add Khadas TS050 V2 panel support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/26f9339212db569310d4b0ef4284efcbb462a86f

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
