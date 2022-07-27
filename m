Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FE2C04A68
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Jul 2022 23:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=okLKYLzjWOhnuK1mQBd9kgb/II1bLCvJBDa7DZNlFxk=; b=kJ3beoTfMQ0Fsc
	YTA5weFi5g/JGuZdKWG9M1JrTZi3uIgjKc7qOLp2Cz1p3oMdi79Gi6F1NfQGgQuzcWq8NhyTLYGfX
	GsElih2ndwp+LX8o8YKUD3cWwnhHru2W8q6Zerwkh5yC4uoMhiisGt78+U1K2np83exsOB3xCp54P
	MNHbtAhfNK6JhMo24DBYzOKYKST3yqGUY8nQMxsXzOwLuHrFEEwwWAfLSDW3JZSp2srA7WNQxn8KJ
	0l7SoOREUdcNYjb2qZg1aBp5XzxEUIZluQAMipqnDPM+W252/A3lJvVtqD6FmfRts5LFeJR9oq/Zy
	Jc0UO/CmkSAjGRmfTpvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGqm5-001ceQ-I0; Wed, 27 Jul 2022 23:49:09 +0000
Received: from out203-205-221-149.mail.qq.com ([203.205.221.149])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGqm2-001cZq-AF
	for linux-amlogic@lists.infradead.org; Wed, 27 Jul 2022 23:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658965741; bh=TW8vKNEEQqoyN+yjZPiCBIS3X/JWuA+Oht9pYgceRs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D2EWl8c7GDT+yOBSqYiezOSoMkWJcuKKQFQxOdEZ7W5ZU9MIPC6l/kxSPg25wsJgA
	 J/pdVCERNVub/UXQ5YL/cEEgUoh7SndRTdXUnPcjYYmQpeB8diCR79eIaIgthiGdN9
	 a485JaW4PZB4veW3ruZesWmOi9YdM/DCJYkyWrmU=
Received: from TS-551 ([101.229.115.99])
	by newxmesmtplogicsvrsza31.qq.com (NewEsmtp) with SMTP
	id C39B5C95; Thu, 28 Jul 2022 07:48:57 +0800
X-QQ-mid: xmsmtpt1658965737to2hsw6ll
Message-ID: <tencent_F809BC863B83870BBEB1EF76499B3969B607@qq.com>
X-QQ-XMAILINFO: OZsapEVPoiO6AnyWo7zDYlAEthUAL7QlhBj4pL1MTcFhgm8MQlauNdwgB507Ax
	 QQJ6Fu/xsP1W5N9C6f3TErWeJQh3OT+nyomoAvfAJGCdubMhiO8UGQ2TQsLs2RqUPgoEnq5dmcYz
	 TIRiM3zbhLyG55YpforjUkABrhZhkHwvi9rKiIR5TSTFnyJIBLETlm10gS1jPUNoCF8ciaPlNEyu
	 nbZcYrb9l3q2FZRjsnlm4Ozsds8c/TI1EOIaIiqsoSBILEyJ3MRVjbabxFDrvsFAx+VUrQ6HJPS7
	 QjYNbtZRCZ7mZ7g65Iai+aGtBdwANnyZyaV38rVHKT75t85H7obTpr8Jy2kWCkNhvQSlZC05APCt
	 ikI+NPjKlAkYuKh3X2XGUaqLY4IYxiRtzdqNzdR7ufHuhwPIaZ7/lYNCtSM3AU+VlK0/Peghdbec
	 GkKZWc4Wi3bzk+2HMA0e3G5N5Oe9XYWKdLUl7Uvsjc5fc5Ez8AKVJ0twYSDzsjvdma9mGZjiDp2x
	 JwvvYTlcvm1LwekUUBqTl2e31Nk9xOlcUi5AxWzNXUAXuWgN5Dd/7E2tX58AdWIVfVf5Q5fCOpxC
	 Vx4qPNU8C+LU2yz3EGHFIA0DyJU3w2ajhajFfZLUw/qhClADu7VlaCJ2XA624SWkSGsAXrw4Piar
	 Y08NpT1K7nqODX/TdO/vuraNfv2QbILOPAzfa2Wis0UqpEs5mC1Yej4Vh7pegHibU7IXw9JZRfAI
	 Nf+f/zu5gY2vhzS4m7EI0c+eMNb1Byg9Uw3T+8Jhav8CNJGTv2RkEhdAShRGaokcXv/oH7CtRX9f
	 RjvOOLIyuxeMMlOI7jXQ4PGiVBcIMljACV/xak171pjXXHFjfo+EYQxtNTldPl6ud+oHBi4g6WfV
	 j3fK/WXefsPpje4gqI/8VfpayXbD5L8w==
Date: Thu, 28 Jul 2022 07:48:57 +0800
From: Zhang Ning <zhangn1985@qq.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	narmstrong@baylibre.com, martin.blumenstingl@googlemail.com,
	sean@mess.org, christianshewitt@gmail.com,
	linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [v7 3/4] dt-bindings: arm: amlogic: add MagicBox M16S bindings
X-OQ-MSGID: <YuHO6dlfrkO9XgFH@TS-551>
References: <20220726143649.142574-1-zhangn1985@qq.com>
 <tencent_A962A641C180EEC2680CA53DDD6643BA6E05@qq.com>
 <b094bf45-ad7e-9e42-89a6-bae0b8e4aae1@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b094bf45-ad7e-9e42-89a6-bae0b8e4aae1@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_164906_724986_EDB77E51 
X-CRM114-Status: GOOD (  11.49  )
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

On Wed, Jul 27, 2022 at 05:27:25PM +0200, Krzysztof Kozlowski wrote:
> On 26/07/2022 16:36, Zhang Ning wrote:
> > Add manufactor bindings for Tmall
> > Add the board bindings for Magicbox M16S Tv Box
> > 
> > Signed-off-by: Zhang Ning <zhangn1985@qq.com>
> 
> Please send patches with correct subject PATCH.
I got confused, and don't know how to update..

ad152daedc5c dt-bindings: arm: amlogic: add MagicBox M16S bindings
3f7dbd336f36 dt-bindings: arm: amlogic: add Vero 4K+ bindings
2ca889b12016 dt-bindings: arm: amlogic: add H96-Max bindings

> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Christian Hewitt told me to split to 2 patches, 1st for manufactor, 2nd
for device, how to handle your Acked-by?

btw, he also said I'm wrong in handle Sean's Signed-of-by, still don't
know how to do in next version. Should I just not send this patch?
> 
> > ---
> >  Documentation/devicetree/bindings/arm/amlogic.yaml     | 1 +
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  2 files changed, 3 insertions(+)
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
