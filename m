Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7855EEB64D8
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 18:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDJa84QtL6m7YUfFdome//CH2ZrvFOnpVMAZwu6x7UQ=; b=MWDtcC7pjUNOl+
	bdXSDT4qC/Q8rjwINqW7Ccu9vx8HXWbcfqKVYqrdq7/hLHvre7L6bVWIhPRLMRZ1OLO+PpY+9kxGD
	sr/dF0eQ5FtORoHXM1ngQWatwULojrcY1mj6d1a4q22vKzYBfE/L9tEURD/GvYKvPxmaI30rDePAD
	mzOMk1TXvSRuBW5XvWeLbPoQi2WnQ4LBTL8Kal1vyAtjXtSGcFGFU5EkYQU3QjSJQLJEBC2+sT/F/
	gR7IjFEXAFSh2v8S10vPB4NjKBfWaXjVduHXCgrh8Col1Wb6AtcCYptkqyz5AOOONRN/wMEYqVql8
	S3xKzExqGc5PuTa2yMdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC2Dx-00FL2y-1A;
	Wed, 21 Jun 2023 18:06:33 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC2Du-00FL1r-2x;
	Wed, 21 Jun 2023 18:06:32 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-25e89791877so2939252a91.2;
        Wed, 21 Jun 2023 11:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687370789; x=1689962789;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Az2bQMNiNgvxrY9glBfDppHJtPk+FnOiirU3h5SFUmI=;
        b=GBwqsylX82eyyI6jaGm8GsagHkfo1ldmyJdiuXnqzkqc4ixPDGmBndPn+m5n78gbEX
         grQ43KpF9obw2HM0F+0Da2EX7FG1TM+0L9uhuv2VxtTTh4Shtd4OnCRuABGudvVq5VNz
         iQaWR9MzmTbR4azKVOEb4dzjdFL4zISHzQ8Xai7eC0gVhiFfJ7tVYQ5E9AAcbFn9q22k
         8Ov5oteaP4Ey9KJbsK4m7VfpYJ2OGGic9pmnWe9y4g9aXPHbx1psYi9x54FtmJyaOHTJ
         If9gncUlG0NfkZN0/Ht0Eesf6ACs38AOXcM3/k8dkmspSHj3mSTLO0ygf69hIR5HeY/c
         7xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687370789; x=1689962789;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Az2bQMNiNgvxrY9glBfDppHJtPk+FnOiirU3h5SFUmI=;
        b=Ib4/8UoWQGmeojTMMbXDIyA+6njgJu7Kx7uO2s0uEJVwHxyeFSSkpsQT+STX6c1I9n
         xzOfrJXfgB5zGsvag+I9WRMTHWQalOYr566Dfuy+uJOBnNDwBi5YI5LRLxj5dkOzAWdG
         fSXRm/xa5xJMPK4jiVw5cJYVI4945X6pnLD9DwWb+fR/PwDHNNqNJAxXD7D/rCKJrA5h
         cmxo/+nYBWaTYuzr+94AIeJ3vQiTNai5RNBQ1y2xeFrvypZ5Tt4nKPg6cbaQYAW87IbJ
         7pMNoenhG6MqNf+JsoyYAzAzsuoXQEjj0mlUP2rwGYjriExqILB4cPw1I40zJKe9Wgc9
         UgwQ==
X-Gm-Message-State: AC+VfDxG80aseObZv3+bYh+8n0njR1ulXFxDG2i9fiSn3W4wHNsc+vGk
	zRBYMdcypbtCJL2K19uLRkM=
X-Google-Smtp-Source: ACHHUZ4rfAeGFSguwikDDJBGuQb8NhqAfqZhPlTkMSahmVCwaEWtuwULvNAqRQTIu3CqkjuDrOxkMw==
X-Received: by 2002:a17:90a:bb85:b0:24d:fbaf:e0b1 with SMTP id v5-20020a17090abb8500b0024dfbafe0b1mr9657024pjr.19.1687370788961;
        Wed, 21 Jun 2023 11:06:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id gq17-20020a17090b105100b00260e7c2cedesm1762390pjb.57.2023.06.21.11.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 11:06:27 -0700 (PDT)
Date: Wed, 21 Jun 2023 11:06:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Joe Tessler <jrt@google.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Wenyou Yang <wenyou.yang@microchip.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 01/28] media: cec: ch7322: drop of_match_ptr for ID table
Message-ID: <dba2090c-e6b2-4a54-a233-9e8f309a20af@roeck-us.net>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_110630_955963_D27F5E4B 
X-CRM114-Status: GOOD (  19.64  )
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

T24gU3VuLCBNYXIgMTIsIDIwMjMgYXQgMDI6MTI6NTFQTSArMDEwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBUaGUgZHJpdmVyIGNhbiBtYXRjaCBvbmx5IHZpYSB0aGUgRFQgdGFibGUg
c28gdGhlIHRhYmxlIHNob3VsZCBiZSBhbHdheXMKPiB1c2VkIGFuZCB0aGUgb2ZfbWF0Y2hfcHRy
IGRvZXMgbm90IGhhdmUgYW55IHNlbnNlICh0aGlzIGFsc28gYWxsb3dzIEFDUEkKPiBtYXRjaGlu
ZyB2aWEgUFJQMDAwMSwgZXZlbiB0aG91Z2ggaXQgbWlnaHQgbm90IGJlIHJlbGV2YW50IGhlcmUp
Lgo+IAo+ICAgZHJpdmVycy9tZWRpYS9jZWMvaTJjL2NoNzMyMi5jOjU4MzozNDogZXJyb3I6IOKA
mGNoNzMyMl9vZl9tYXRjaOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQt
Y29uc3QtdmFyaWFibGU9XQo+IAo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kg
PGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KCldoYXQgaGFwcGVuZWQgd2l0IGh0aGlz
IHBhdGNoID8gSSBzdGlsbCBkb24ndCBzZWUgaXQgYXBwbGllZC4KCkZXSVc6CgpSZXZpZXdlZC1h
bmQtdGVzdGVkLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+CgpUaGFua3Ms
Ckd1ZW50ZXIKCj4gLS0tCj4gIGRyaXZlcnMvbWVkaWEvY2VjL2kyYy9jaDczMjIuYyB8IDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvY2VjL2kyYy9jaDczMjIuYyBiL2RyaXZlcnMvbWVkaWEv
Y2VjL2kyYy9jaDczMjIuYwo+IGluZGV4IDM0ZmFkNzEyMzcwNC4uM2M2ZTY0OTZhMDAxIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvY2VjL2kyYy9jaDczMjIuYwo+ICsrKyBiL2RyaXZlcnMv
bWVkaWEvY2VjL2kyYy9jaDczMjIuYwo+IEBAIC01ODksNyArNTg5LDcgQEAgTU9EVUxFX0RFVklD
RV9UQUJMRShvZiwgY2g3MzIyX29mX21hdGNoKTsKPiAgc3RhdGljIHN0cnVjdCBpMmNfZHJpdmVy
IGNoNzMyMl9pMmNfZHJpdmVyID0gewo+ICAJLmRyaXZlciA9IHsKPiAgCQkubmFtZSA9ICJjaDcz
MjIiLAo+IC0JCS5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cihjaDczMjJfb2ZfbWF0Y2gp
LAo+ICsJCS5vZl9tYXRjaF90YWJsZSA9IGNoNzMyMl9vZl9tYXRjaCwKPiAgCX0sCj4gIAkucHJv
YmVfbmV3CT0gY2g3MzIyX3Byb2JlLAo+ICAJLnJlbW92ZQkJPSBjaDczMjJfcmVtb3ZlLAo+IC0t
IAo+IDIuMzQuMQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
