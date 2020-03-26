Return-Path: <SRS0=29RQ=5L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADC7C43331
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 22:43:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC7AD2073E
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 22:43:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WEh0FdaA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="MQPwBnmA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC7AD2073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MoUPbFBphMT6XHDIDd3NGDIkQlJdzUO2oX6qB9y8YxA=; b=WEh0FdaA1ooCNk
	a/ykufRoIix3omT9HGcy0PH8cGFecqZ4kEdVcYV+ReDHp9y54dCSJ+rRTSLoigUANmEzEobb+/iHb
	i3tVjXAGLkm69ItYgWiVVHyBs8I6O30oi4fhPIlHW8MdgK2r/vLLtQsbcA+ax2/zohk1BNB9svjtO
	xJgMAwghUwkJP/lOys08SHc+S/5uVInOAorvBVZxwl8oyWnQBXdAJ407ybjFw0j5VC8l4L4Z5/KnJ
	ByuGBPmSUUdyLuekAzy1lTe9Z/29Ir17xBwyUn0PWoum9JEY2gAy/KWNKiUWr6nyAQjXJWwvpiIwi
	8Mjz1CsfttnGf6Fk21cA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHbDA-0002zw-Ad; Thu, 26 Mar 2020 22:42:52 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHbD7-0002zF-GB; Thu, 26 Mar 2020 22:42:50 +0000
Received: by mail-ed1-x543.google.com with SMTP id a20so8951383edj.2;
 Thu, 26 Mar 2020 15:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rUglTJY60k/VNdcHM8mWBp0Wt/HBwX9IipXPiPlgn8w=;
 b=MQPwBnmAmuVapE8voWiDYLTWURcpWf90RQTJQGxGPu6mY/54TCm27ZFBemawysP2ne
 b4TFic9ZqjeDXKtxb1Vad6mx60Le/sdnGqiAR03fgOdCvWE+8M0mOQfW4lBUWoe4DLYx
 2h/P8RB3ITGLcpzLJpIaCdIxJNl4n0J3o1unJhwsNeVUv7BH+bZBRvekEdVPbhuXjOFF
 YsRYaclcewnZxcNXsoWCmFUNnEkhQAA+kJYgU6JG2IoHy4hwRnGVg/zdOQJH6O2pXuuf
 am58u4bgb3p6yFSQ7NrbOH1JjPbTIOlVKllIHGU22jhZG7jh55ljownJP9WdcMMoZxVo
 /2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rUglTJY60k/VNdcHM8mWBp0Wt/HBwX9IipXPiPlgn8w=;
 b=ZZAQ8r+0DHrm9xpG20/xrIfer656X9SGCZSwdI6uBg98WPL3a4ttHNsAVy1Lrh5lNB
 vvbAIIQZ/2gcrARaLEVIqLSBXVBB47Rqlsc7W5ePmP2sTKbU/VLCWf5S07jqTP5hL4CG
 iDyJr7tMjNc/f23mszLV+GM811Luvn3HoPjlX1Y8nVpLxBDaU/trqfClPz5E8AnoVTyp
 s+sOiriHZwTZD44b38BjhdUGKTgqptDGqFsfv3t99Gx/OncCQLIoM06HIy2g2NPShe6r
 sStXM0EDMs4sS2WRwIBn2M9Vray+78smLe7h4BIW2Ej2H+PUzD1/ZcfpcQ367MLgFUJW
 iKLQ==
X-Gm-Message-State: ANhLgQ2Fmqu8HhRp3YM2i9ommth+EmFhsXtk0rJBinO+fDisCPedAXdf
 sFBVw/OOMa11lq/4ztYyApqxTtQhJXib5w5YHKY=
X-Google-Smtp-Source: ADFU+vt9fM5/Lh/iQoYKhQ3WMcsmWRhFmWbiBIl4sQGfSjNJUrYw3Ar9BVh+r+b3CVNqxhzzfDaylTNHvbh2zBIdt7E=
X-Received: by 2002:a50:9e45:: with SMTP id z63mr10548437ede.338.1585262566004; 
 Thu, 26 Mar 2020 15:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200326160857.11929-1-narmstrong@baylibre.com>
In-Reply-To: <20200326160857.11929-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Mar 2020 23:42:35 +0100
Message-ID: <CAFBinCCwvfycP9VZ35Jn=yNRbgbUYkRucLPpRGCJv2XCTR+o6Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: meson-g12: usb DT fixes
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_154249_566292_7201A195 
X-CRM114-Status: UNSURE (   6.59  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Mar 26, 2020 at 5:09 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Misc USB DT fixes for G12A.
>
> Neil Armstrong (2):
>   arm64: dts: meson-g12b-ugoos-am6: fix usb vbus-supply
>   arm64: dts: meson-g12-common: fix dwc2 clock names
for both patches:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
