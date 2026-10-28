Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F054E606A31D
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2026 16:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IzFZLrBo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBlkAu6Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pWv08o9BolzXqvI/eF3LP9lTqRgUF+QgJ2CwkRt9J04=; b=IzFZLrBogB3zRpHNikLJakider
	Pb4hmXM5dri19TLfG3j4BOqVbGTcfr1Vp6PnIXARwRG3bX01OdQwC0HcOGaBKvR5NhZmYGIHweRPg
	f4uiRVd1lAX/RJS7Y7KKMLY4dkCtjx/B9+XzAu1jluP0e7R2oL8FC4qIUAHXtU9MfXidBq+WVkpHI
	H1F4es1XXFlKAErthAvIzy2PQre9trnboLpNWq/dv3MZs56KmF0UVqZr/kJ9lZi88QNl9XyNbcKHk
	HZvvWc+OKULXtd0Vl4PQN6hV8mg7uIAsUVBnXVXoktqbKh3JegvFUu3/Fs4eoiMCVn/qpgmgInuXS
	AnsnVpZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6rL-00000007ao1-2sVf;
	Wed, 28 Oct 2026 16:50:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6rI-00000007al5-3uJd
	for linux-amlogic@lists.infradead.org;
	Wed, 28 Oct 2026 16:50:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so13630515e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 28 Oct 2026 09:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793206239; x=1793811039; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
        b=ZBlkAu6Y0faI05YdQ62VdbxXwtRweghaD7Hf6qgKKNzUPN8/C+8T0jGQcWi9aFNc07
         XkXnDTNrmy/c05czl2ctI4JyPufeY2hiJlTGeKfw7mZvWsGG6iWqjZoKS+6nWaBamL7f
         ZqH9lewnJOLWNMoxTxubMiEjkxw6sYPwBJof0CAqwKE5SZU6UVCt0xEAnLmuBqFNfAHK
         yCk9cGrj2kT/CsAiTHs/65GTEzM2vgVwozr6umyNjOmqB+Y3PfwRTJK15iY8TNsTiaVu
         EYmJujRFDIy4Vsn5PACWb+3YXW5kb3oG6h7iY1YrokksqIORB97Bi2mJQIqnEEtya7JG
         heqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206239; x=1793811039;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
        b=nyHycd1cGznBJbZ8FltyWhC3xJhP27SdwHUuq1csG/L1CjC4/1+0de+Cg3i1XViKXD
         mMx663loEoBokplMeq04FRqpZ3wAywHo+u5ufV24yxzmFGwokqXmtLXJe1UcvxRZ08oN
         LJ13x1g2mh1M9WzaaFz3eLR5kLuxP92FsxdM86pGDPLFY1sO0aC/Cj2J2zXBkLZE4dDH
         M+ePfxeiwd/0GaW1CeGZDRy5GgOuY2ZRvir2kYXt3rnfqfO9FNUwkgr1wGBC7xA6ImN0
         iBKBSgbjbzjwCFnYXBHXgBTnGC6TzUHoYkErupNf04vQ3cajMePw/car5+AIxsr1Fs/h
         XDVA==
X-Forwarded-Encrypted: i=1; AKwUvBycMqwjV21mh7JYi+pNwxV0HtdyqAjsiv1TQfRvhVTerIEeXwfBNU4S9nsn2twK3Hf4uZVhUUYw85Np1ThZ@lists.infradead.org
X-Gm-Message-State: AFq9FYLIDoIKseEBxq6b7MIHazeSdBeUatBJJpxhEBd3N2NKW8LsOHPF
	KgI0iF20KWoVeO2LucqrGbk561SePpATwKU8+4GzjV4gz/jv8c98hKX+
X-Gm-Gg: AYBFou1itNEc/BH5Jd5cc1/MSDD1MIU5drQsI3HvehE8Rmxm46tT9DRu6qJQKHkvvMO
	czNjai7Aa/5Q4khEUS7mdN9XhQeInakBtsZv+Jh1R6jolH6dBFynj7FN+78xeZfGoXtrxCJR/5q
	wG7Cj9fnXaLd4CzDesFVt7GGRzuzB6xZTArCaU+G1G5PrV50Y2ZyW+wkHm1nGRiJCD3z17D0ZVv
	e1tRWfEupU5hbwfcZwzZhtwhxm8fyB262zmLEPvsw1ZuBYy2Fa08EHYtrmxcjqd92qavFRgjgWQ
	iR7t870gOLq3RjXtZiaKciNdxFd0E3IIU0djZldltfyJBUb7u5tsdH4vqqL/zxu7x1ZGSeOpUXz
	gsisaugJeux9wG+5XamN0ciSq5XkthBm7LSnW7KdmsbMW0xJWb0rk3bW1iBGFtHe9lyf8DxcjpO
	Hy91KT0xRGeOjF4dNX4f/XJuRxuHmJI1JcUb2WwjNsG5Irn4OcWccWqiPVlajtjDv+b83tZ+lwg
	R6V48PehI9SmMoww8uGvl2gi/BRwNp/+j9CeWiLzykTRUr2vn5clU3RhHObKDjMV3e40YRx1O4r
	i6KNCJ4T4rf13uD7p9S1HcrXyo8NQWyzVTQlgUxu3iCv9b5TLn9YjLN/hcaCPTRgVkEF9O9YhTH
	aaS+eHn/b47df/+BT
X-Received: by 2002:a05:600c:630e:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4a9678bff9cmr62960175e9.29.1793206238343;
        Wed, 28 Oct 2026 09:50:38 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc4d76sm29895785f8f.12.2026.10.28.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:50:37 -0700 (PDT)
Message-ID: <6ae227dd.6c7231db.220083.ae75@mx.google.com>
X-Google-Original-Message-ID: <auIn2SfzeFL2CJn-@Ansuel-XPS.>
Date: Wed, 28 Oct 2026 17:50:33 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Anholt <eric@anholt.net>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Peng Fan <peng.fan@nxp.com>,
	Aakarsh Jain <aakarsh.jain@samsung.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Fix property name typos in if/then schemas
References: <20261028120216.2657397-1-robh@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261028120216.2657397-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_095041_000084_A24383D7 
X-CRM114-Status: GOOD (  10.24  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 07:02:12AM -0500, Rob Herring (Arm) wrote:
> Property names within if/then schemas currently go unchecked whether
> they have a type defined or match what's in the top-level schema. Adding
> a check finds a number of instances of typos. The typos result in the
> schema having no effect on constraints.
> 
> With this, fix the mediatek,vcodec-encoder 'clocks' count constraint
> exposed by the name correction.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

For KPSS:

Reviewed-by: Christian Marangi <ansuelsmth@gmail.com>

-- 
	Ansuel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
