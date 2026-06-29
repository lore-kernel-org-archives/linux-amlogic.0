Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656D4C43602
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2026 13:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KiaMXXxLVtvN3mdHzoEj+WksDlC5p8eHNV5S4v3f8vI=; b=N7TimBXElVKAEu
	5lv41XvMZb54aghNxtVt0yDBk+eXNJxpZVx8EnH33y+yhb14OPsWgySL4koKqK6w89pG5eaPmos/U
	9Ue+hb1MFKraDK4tiNg/xRYzSZcYUfp+eIhc3boxBD00MEnKrVBmXBMjnLbka8TDYhLA80hYgB4qJ
	9+mXBW8hhBYV5sBjRBRep2xnTqBVxdPsmL4OhsfdzgRzS9SEaleRGX66PWwhXZe1zxdODpM8ZI7Nr
	4698riAl0qZX/lkhp/vnlqwJ3XFF0e4LdIAmiT/NI6XSfMb4pwhjLaP2tv8qOaZdt3icN5bjyyli1
	jzWjYhZzRpCQ8JJCC/5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC9c-0000000Elz1-2dPA;
	Mon, 29 Jun 2026 13:36:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC9Y-0000000ElxB-2fBA
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Jun 2026 13:36:02 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493a285ff0cso8153345e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 06:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782740158; x=1783344958; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RBM+1nAZz4BwsUG4gfSKzLFy6PeoM2OFZ8wfEYkLDpg=;
        b=doyC8I0iyjgl9WNg7f1yJvwuKOKmYWmbgU7IZ2SdeB/6DOf1CFr3HCgx5t9DHg+64t
         Cc1H1N/rX2bnuuYOLBdcc5+GelvAd0kaGgyTCorXGQobQQLhmHF/lq1pWKVVe1GeymNR
         2KnWDhtly+3mfIgYsnlHgVZVLOU/tiEddK0nalEwx8HEPRjq4nIJM9OJG7MqgHlOtba8
         RcJ6QHpbmm+PIL8KU47rPK7JfGGtAk5TzYO4EcLfE/qxn5FC7jIGLRHenZ8jWteIyEQ9
         /06ANjhk+9STkzV5T9v4JGdSqvBbvS6lNIISiH1AE7cbL0X2QguSK6weSrnU8sX4IiVQ
         gf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782740158; x=1783344958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBM+1nAZz4BwsUG4gfSKzLFy6PeoM2OFZ8wfEYkLDpg=;
        b=i2mHWey9h9F7d7zRDhgaMdlT7a3K1zn6puYnHPJ0UGW4mMN8n3Wr3GlFi5Lb4w/aXg
         igjz+DIeTV4MDFpeQdU3eeMeYGQTESagEuCubReUC/dlJc8fbzfZXz6VOo9A8DPthaBk
         15infa4x3+ssUgHOu6bxLRemd3Y6uoafax+HjEvfU5/XB7WMGjFwXpGxggPhMsfp2j5J
         R9l1z6ng0F5wdz86aax+SfCZlEJVPAlnVli9/JkF9IG4AXP9omZxNpKHK3V/u8wfIElP
         To5AsMBV+BOYa+i9+wvZUTMrXX/n8p7uht/ycyLWxTFCzPNDj6M9QPWTO1KK1uLpofJY
         ZtnA==
X-Forwarded-Encrypted: i=1; AFNElJ8MzsQWr6GKZKqcxjyYWMTmhpg4H0AaThfBmmaJ0Um1aEZQrbI6ymL/ZoUkBpb1nwqzGKKQQWWbZYooyE5q@lists.infradead.org
X-Gm-Message-State: AOJu0YwuzUbwVxkAhE3zP+oOqGW2ybhTJikS1MXhdVD2oMPEmC6qFeYZ
	VxYB2vZu3vezao9f5qEgEUEiEAtIy6xUux8CSZrXhMdfqsXhtAZY+zRT
X-Gm-Gg: AfdE7cmTx7bd1rHQF+c/dqHnYdF0AJLDtqehuNBGcXkWcL5PhY7t7IWwhtEFgJSrb3C
	M0H43S8ChW4bFxEzu2YlwzdmtffWrHYY170MJEIq/xIx63FAacNnzPROXBzBfSiCNaUf04ONPnU
	waSvb9SWY37j1YxtqliU6bNi/PXDFgStkuXnjPCGHt313yP0qiQMkYboWEZsgYEbQBJTlLOvJ5b
	z/r2DPdrptgbGtqW+hg1bAYSQm/s9A+hqUj8goD9tS5EJT9xk63VQ4PVilZuHdPElqFZSietr9E
	2aNJx36DxbXPC5jK6pqEZpE3HzR50hhIEQwipTzCKW/wdVpr5pCv4+nf68KnjoKCOY/0SVGFxOa
	xF9K7hbuuVZaSOmx9ltN9x3unA8HFOmdeSJqlbdE1je4dvy3b7dDarcl2m7TGCJENi5jvzz42AU
	nOhpS0wZsORwaLVjngEy0Cpz19OqW64WFmgVqeUw2t0sPEmreroibI34JB+NYwllXszsoduiMT5
	mwxCUUd
X-Received: by 2002:a05:600c:524e:b0:493:b2c1:b302 with SMTP id 5b1f17b1804b1-493b2c1b445mr34652035e9.16.1782740157956;
        Mon, 29 Jun 2026 06:35:57 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47327c47122sm13954850f8f.34.2026.06.29.06.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:35:57 -0700 (PDT)
Message-ID: <2496717f-12b9-4d33-b6db-1db278aee8e2@gmail.com>
Date: Mon, 29 Jun 2026 14:35:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 2/7] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-2-1b7fb95b51f9@oss.qualcomm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-2-1b7fb95b51f9@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_063600_687294_113F3D2F 
X-CRM114-Status: GOOD (  12.91  )
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

SGkgQmFydG9zeiwKCk9uIDYvMjkvMjYgMTI6MjgsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6
Cj4gK2NvbmZpZyBQSFlfUUNPTV9TR01JSV9FVEhfU0NNSQo+ICsJdHJpc3RhdGUgIlF1YWxjb21t
IERXTUFDIFNHTUlJIFNlckRlcy9QSFkgZHJpdmVyIChmaXJtd2FyZSBtYW5hZ2VkKSIKPiArCWRl
cGVuZHMgb24gT0YgJiYgKEFSQ0hfUUNPTSB8fCBDT01QSUxFX1RFU1QpCj4gKwlzZWxlY3QgR0VO
RVJJQ19QSFkKPiArCXNlbGVjdCBQTV9HRU5FUklDX0RPTUFJTlMKPiArCWhlbHAKCkkgdGhpbmsg
UEhZX1FDT01fU0dNSUlfRVRIX1NDTUkgaXMgbWlzc2luZyBhIGRlcGVuZGVuY3kgb24gUE0uIEkg
Z2V0IGEKYnVpbGQgZXJyb3IgY3VycmVudGx5OgoKV0FSTklORzogdW5tZXQgZGlyZWN0IGRlcGVu
ZGVuY2llcyBkZXRlY3RlZCBmb3IgUE1fR0VORVJJQ19ET01BSU5TCiAgRGVwZW5kcyBvbiBbbl06
IFBNIFs9bl0KICBTZWxlY3RlZCBieSBbeV06CiAgLSBQSFlfUUNPTV9TR01JSV9FVEhfU0NNSSBb
PXldICYmIE9GIFs9eV0gJiYgKEFSQ0hfUUNPTSB8fApDT01QSUxFX1RFU1QgWz15XSkKCmRyaXZl
cnMvcG1kb21haW4vY29yZS5jOiBJbiBmdW5jdGlvbiDigJhnZW5wZF9xdWV1ZV9wb3dlcl9vZmZf
d29ya+KAmToKZHJpdmVycy9wbWRvbWFpbi9jb3JlLmM6OTM2OjIwOiBlcnJvcjog4oCYcG1fd3Hi
gJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluCnRoaXMgZnVuY3Rpb24pCiAgOTM2IHwgICAgICAg
ICBxdWV1ZV93b3JrKHBtX3dxLCAmZ2VucGQtPnBvd2VyX29mZl93b3JrKTsKICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgXn5+fn4KZHJpdmVycy9wbWRvbWFpbi9jb3JlLmM6OTM2OjIwOiBub3Rl
OiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcwpyZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVh
Y2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbgpkcml2ZXJzL3BtZG9tYWluL2NvcmUuYzogSW4gZnVu
Y3Rpb24g4oCYZ2VucGRfZGV2X3BtX3Fvc19ub3RpZmllcuKAmToKZHJpdmVycy9wbWRvbWFpbi9j
b3JlLmM6MTEzMzozOTogZXJyb3I6IOKAmHN0cnVjdCBkZXZfcG1faW5mb+KAmSBoYXMgbm8KbWVt
YmVyIG5hbWVkIOKAmGlnbm9yZV9jaGlsZHJlbuKAmQogMTEzMyB8ICAgICAgICAgICAgICAgICBp
ZiAoIWRldiB8fCBkZXYtPnBvd2VyLmlnbm9yZV9jaGlsZHJlbikKICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KICBDQyAgICAgIG1tL3RydW5jYXRlLm8KCi0g
SnVsaWFuIEJyYWhhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
