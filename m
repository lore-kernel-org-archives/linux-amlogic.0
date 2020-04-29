Return-Path: <SRS0=SdFN=6N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F10C83000
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 18:17:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A79D421D79
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 18:17:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="at54Wtvp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FKjVRVJH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A79D421D79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eUw4mxI1Xg9qgjxDX+kLTZE+qDZjmLfZxUy2ICV/7eQ=; b=at54WtvpaALPhe
	t8iUf0oguNA7nWyyqVYFoGvlqMtYoHRoeRToucSLDIQh4YtESEosWbTySMSM9gw0kl5EqgKw9fdjA
	LsnPG/+1AJOPcA/Y2/gRYX7IXBqEz3gIlEy8iOl91eZhsQY1yWcWik3bp7SzinrXhWdUpOLZVjn3Y
	LAxbCjrvwgWyATb81sl/QZVEFQbI9YWs718/4ORQJk9litLsNLh5ej7kRaZK7vhm7GT4xTHpekYuw
	VuJfaA/CrV28I21XFdDKqDVjAe5/05mBWpKS0pKwaCNUOSmu/4bE6IfR4dW/AyTLGk1iq2gzZamqU
	SWFfHXTBVigG9wIuaOgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTrHK-0000Mx-Ld; Wed, 29 Apr 2020 18:17:50 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTrH7-0000Be-Cv
 for linux-amlogic@lists.infradead.org; Wed, 29 Apr 2020 18:17:39 +0000
Received: by mail-wr1-x441.google.com with SMTP id b11so3709078wrs.6
 for <linux-amlogic@lists.infradead.org>; Wed, 29 Apr 2020 11:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=6lfBNlbD4T5zHjO+6zb4aZNCWH8fCBIeJ2zjUEDU5Bc=;
 b=FKjVRVJHicGYD5WTdJMpWpXGtXFSDFjc3LSxc/83GGZ8OWLBuAvH48kbmhFmH5ZKHB
 d6KbAlikjeM2P79sOAnW/zi0L2TjWf6Cr6J/FSc9jNiv/XGitGeOwKbgrCuHv9ganP1U
 /fZeIlvVbQ1LF9LRihu8SJyJ4OHY0kVwWrIMT4nC0afpeRcj4PspcxUtSdELtnTvVhRv
 5rFC1BrK19UiqlmhPKi8ZsKVsvwJC4YuRI2YvtiSDgPHSiH0Qz01kzhtgLmpHjiY2U1K
 +LdAafAP9WKp1Z4p9nowV648/ClsicXciqHrLDPmj4I2kWcm5QXnh+y7IOgSx9nDF1lw
 AWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=6lfBNlbD4T5zHjO+6zb4aZNCWH8fCBIeJ2zjUEDU5Bc=;
 b=XTnmc3pC7zbdhC0P5Bmw2+ucgu/sW6ihFUPKHi/y/LOs3nCQH6+pS0dc2Nw4SHuqRf
 jnPCdjUwP6P37Z4F+KPf+bF+k1kZststJvl0Ukt8CARtSHnOsK/qenctGW4G4IqAKEkW
 fYOupuCUsUggEX7mE5etXC03IW5RwfhfbIsqIim/SjYNkS98Vs4QQYlAGVLkV/5LKbwT
 8Qbefk4dWr10jUH+6IMoHsbSkitmlNctuQo4dtQOW8twlToFNdVxUXQlBSVij3pkt62n
 TsGkKlVzi+fHUahlHn4PDU4LXGPZm9i6h8i1PCL5IDHvH+t6u97rFR4ECsudYCDWOCnd
 s4hQ==
X-Gm-Message-State: AGi0PuZCjloobTlXtG39lGBMYDRq5UmYqfFx/UdGI0vnIcU78J6eKKqX
 t7vn0hPdZVQcBahuw5lJM4poPg==
X-Google-Smtp-Source: APiQypKmIw7W+i+Z4WSURtf6yTrOuBc3eZpc5F2oz+HJ9/6IIKwwniMHrNOG570XslOxNrE5vDfyfA==
X-Received: by 2002:a5d:5081:: with SMTP id a1mr44188891wrt.81.1588184255519; 
 Wed, 29 Apr 2020 11:17:35 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id a24sm8596897wmb.24.2020.04.29.11.17.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Apr 2020 11:17:34 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, kishon@ti.com, balbi@kernel.org,
 martin.blumenstingl@googlemail.com
Subject: Re: [PATCH v2 10/14] arm64: dts: amlogic: use the new USB control
 driver for GXL and GXM
In-Reply-To: <20200326134507.4808-11-narmstrong@baylibre.com>
References: <20200326134507.4808-1-narmstrong@baylibre.com>
 <20200326134507.4808-11-narmstrong@baylibre.com>
Date: Wed, 29 Apr 2020 11:17:31 -0700
Message-ID: <7hr1w6kvgk.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_111737_506908_FAF23402 
X-CRM114-Status: UNSURE (   5.60  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> Add the correcly architectured USB Glue node and adapt all the Amlogic
> GXL and GXM board to the new organization.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Queued for v5.8,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
