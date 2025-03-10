Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEE5C35FF1
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Mar 2025 17:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J0eIxo84GaPM8mDIaYAGpv5lwb9Mx0N8cpJnexGzb4I=; b=woMfoHoS9WZdck
	BKL/yWo+Si6taCL4bkWjKFxAiaphZpmdXgqI99keqrWaOHi/rZWjy5No91g+R+APPlGMsh/qIsUBO
	qxcgrP2bZujZjv2f+9hylOzAc9VglALkGmvfxZ2uFE//ZwBOxwJqimGLZ78V4W2UfgMAC/7H75dXX
	ve6UuTxOWAVPZRxjFoXpHG83dHkj5Rc36bNP0FiObP5/al6Ewpke7VDg7282owH4273H6a2PU+Ikc
	Elg0jCLGV/LVmdI6gXaQz4vkwFh0lFWC+TWAfZe6a2So73J5bvLVTnzulUQAa/eqm+D2Vqai8FiBq
	WV6Jt+9uDB8T33RORomg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhGx-00000003X06-0v32;
	Mon, 10 Mar 2025 17:50:39 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trfdX-00000003JNY-0bNo;
	Mon, 10 Mar 2025 16:05:52 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43690d4605dso27094435e9.0;
        Mon, 10 Mar 2025 09:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741622748; x=1742227548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sBzCrcWxCos2ucPDzOy8rSIoDUK4uuBb9IVbzpXf6Y=;
        b=SezteRQpgEw7Nln4T+tRrf1dIXWO8hRl9pnnkIh5nFySK0sL/Ik1LH99n0xEEQuDVa
         WzXrULpmWmlfEE5ucqYS+PdcnD1tYMtSfH9Q+e/6qvF676H+ozG7o/4sFx0sqBbMKKA/
         JJ4BJHb0Qh6vAmSwCY424Y3Gb2FvSjVA76UlqGFM9EzizKqR5F7ycsb77Al/tB/RJ7xf
         RTbAh7qHfMVB7j9njY3mI2TFuu2EhjcyRpGSDT9f76Y6fKc2akHL8Sxl3XQd9qKHiOEb
         XaEXBgbabUjDpT5V9jMAwgBmm+5rcUTydmL6WI7vrhoyCz9R9BpoGgHImXQ+cObS+x1V
         0V4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741622748; x=1742227548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sBzCrcWxCos2ucPDzOy8rSIoDUK4uuBb9IVbzpXf6Y=;
        b=BTTCJlpeUtX3SWN0btvXW445NQEDIAxiIkK48VdPsVL8QujH28Ec8D4+iKo1bBMQFH
         Affs6pTU0xhc7hPRflBf0ySvGB2kPg+4F1SY7akAR0WIrOjAkVhAVtkuOyfAxN4kl6IN
         UdrQmP+skUKKNMP9GORe89JEIlOSiSM0FXlLgzk3yYIUzWU8sjEGblb1zzuF/DEzFHh+
         Pkg7wLnVkmlDYdD8AvAMVP0wOUqLMC7kKg2GSLpOvmNJiTEl991tptsPKhTo5xrgovkO
         7xgTUHH2vMVgSa5qr3R1Bbu3FfDXYfzfOabOCHEe2HxEMqjYOkE5Z9BFuxpUUcvFxrcF
         JE0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBKBYEM/nGWHD/9adJgeeigNXupDnEN6/PysKDhKtg0XGP9B0HHqRmEb10YvdPBHnjN0w7lqQVzgpXYm62Stw=@lists.infradead.org, AJvYcCVmCE7ZiBCHuLA9IZ9wVIc8KCH0/USSHK9U8Cyc4pRJjRx6CQFkI2JXK3ANzQUokRL51VFcGWYdaAOUfifJz6d4zA==@lists.infradead.org, AJvYcCWzImukpmGJsq6OzaCe8u+NyLx8ucU+ZROAV/xu2ZiXycTmTFatmzM4ZnXjhLUqZ1ZmOp3BpyoRKAMVUW4o@lists.infradead.org
X-Gm-Message-State: AOJu0YyxyW7SydRXzf5ecTfsz84D4ZKZAHa2huCdyFwMm79IIdfr+J+t
	wEATxEcbFAqoPAEyu/OrJ4Dl/Yw3uh/JQZR51vb6G7hDKc1iIGJY
X-Gm-Gg: ASbGncvdBxSOZmS2FXjXpEGQeu6kGZuV4DFBUSf6TCTf2UPGnswHTgzk/USSoyFMyUn
	N+MlvSdlcDOavh68TBTAR6XBNwpydY7TqnTW61ObGns0KoJVJjRMiwRYcxx/St/E29ihKma3vwR
	4xyViDZuH53/jiHXT+jonxciAN1BINEYtc7YLmrfxNC4iSCWIbLin7so9RCy5YQ9ySc+1TMU5ZU
	Iz5CXgWr9n/00y3lW1PnvXQmQZ331As3vASYZ5lV4tuiaOx6MG3vtvpsK0mt7CqwbjJe60EbFCq
	GWJDz0sSQySsV/iWuI+xAvTjmakuA1Nrp+XrC/7VBTirHwHxnReCFRWQYYbLbTWZubbZYxhM2nl
	5bGtj258M7NDiTGe+fsYp
X-Google-Smtp-Source: AGHT+IH1HHf+1OpwkvFsYArfklWxYPjgWRGPYO6MW19aTR4oUCtXkTsxgz2AKwy1itY/6jY/cI2jWA==
X-Received: by 2002:a05:6000:410a:b0:391:4559:8761 with SMTP id ffacd0b85a97d-39145598929mr2906294f8f.36.1741622747749;
        Mon, 10 Mar 2025 09:05:47 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cfa0723c9sm34686035e9.6.2025.03.10.09.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 09:05:47 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wens@csie.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 9/9] net: stmmac: sunxi: remove of_get_phy_mode()
Date: Mon, 10 Mar 2025 17:05:45 +0100
Message-ID: <2774218.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <E1trbyF-005qYl-Lu@rmk-PC.armlinux.org.uk>
References: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
 <E1trbyF-005qYl-Lu@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_090551_178603_0E0FBE74 
X-CRM114-Status: UNSURE (   7.47  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RG5lIHBvbmVkZWxqZWssIDEwLiBtYXJlYyAyMDI1IG9iIDEzOjEwOjU5IFNyZWRuamVldnJvcHNr
aSBzdGFuZGFyZG5pIMSNYXMgamUgUnVzc2VsbCBLaW5nIChPcmFjbGUpIG5hcGlzYWwoYSk6Cj4g
ZGV2bV9zdG1tYWNfcHJvYmVfY29uZmlnX2R0KCkgYWxyZWFkeSBnZXRzIHRoZSBQSFkgbW9kZSBm
cm9tIGZpcm13YXJlLAo+IHdoaWNoIGlzIHN0b3JlZCBpbiBwbGF0X2RhdC0+cGh5X2ludGVyZmFj
ZS4gVGhlcmVmb3JlLCB3ZSBkb24ndCBuZWVkIHRvCj4gZ2V0IGl0IGluIHBsYXRmb3JtIGNvZGUu
Cj4gCj4gU2V0IGdtYWMtPmludGVyZmFjZSBmcm9tIHBsYXRfZGF0LT5waHlfaW50ZXJmYWNlLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyAoT3JhY2xlKSA8cm1rK2tlcm5lbEBhcm1s
aW51eC5vcmcudWs+CgpBY2tlZC1ieTogSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQGdt
YWlsLmNvbT4KCkJlc3QgcmVnYXJkcywKSmVybmVqCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
