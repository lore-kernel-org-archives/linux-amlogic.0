Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EC4ECE588
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2024 20:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSbL7AoyOdkUAJP6yOFmkegys75CGV/KtIiETAaOK1s=; b=ShwkfpzM5m5Uzm
	4rloDUuOGc0Z3gp8LQqKu9v+gLvc45LNIWn9wM9lBdR0bHeXnLKpQo4aeNckyycIRL6Y45M4iTEqi
	AWu/6mqkPAl5/wHZdpRPNPJvPZPpUr6t1lg7S52229cmhQO+lObV3IRLVpW447wVCVppqyX+cAV0t
	n/Fj2bL9oGl3HGLGEgGEE/oGbMgho1pECeraWJSSyydUpiqQnvLqJld+bcZTzB8hAJw07RYzhgXj6
	h7aQglQEaRYhsnXRbwBuk87BQcbXk/NvxfVQqzpFlHwYJJvxKFl+kmc4Kaq2mEWfO/3rWtEZ6/P/s
	wYJAXxy1Bgk6srWIkTdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snkzM-00000003EC5-0SSW;
	Mon, 09 Sep 2024 20:27:56 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snkyc-00000003E7J-07Qn
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Sep 2024 20:27:12 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2068a7c9286so44028885ad.1
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Sep 2024 13:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1725913629; x=1726518429; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5E6k6fN61oDvs97hqoZ2LmjaBlLJG5fTuC732Y/WaY=;
        b=Jzh34skOoRLre7bnH+xjhzXW4MSZShkdpbNamQnpEw3uGPYmR1m2pgmw8GQS9H/Xqo
         OwGKTnhX1pQyd/6/Oxq5/9Ry4pLwuwlHuJYrQrAWY2ZPcpSDswMOMNtNhSBbjr4tqaH2
         c3la3q+Cf3yR91XOJbIXhs2eYwgJgd+frYhYcjLVZG4lODqnbnEc1/0iTsG3N/egpseb
         GkElX57pYhI+61fFcK62Wi7Y4rcoAonP2erRv758QYQ0+jd32X23q/L/xDP9SfRX99PN
         6ITtIyanCcveAGQyysJYXSkezSPHLriWhLcEIXUR3mjWI5fhuH/ja55KGsHclZNpvtjt
         TD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725913629; x=1726518429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5E6k6fN61oDvs97hqoZ2LmjaBlLJG5fTuC732Y/WaY=;
        b=l+ULvRjRddx02Q3YPlmGoHyUfDUm12I2fUl0LFVoSlZxM4kz8Q1CzyJj54AfMLcxQ8
         DUXrdDg45Il1w5zgQcbc+e7GNOF46Li7UtVnd9CjsdY6nEgMMlb+n/9/6i2eJrUykWX8
         qeNC3vJcRzZUwn4IHKg52MeyvVQ4ruRsz+V7LvtAodCg6FbMgEz/YMxRUYnrdd55ERUC
         vj/EsrvoOKBhvl2BrrvqK0ZCHMicMrtshvUvg2f/0xXnDHfVFHOzX3FtAssxDGa0A8Px
         VTc4ElYFwwnVaDRqtKhbeCc0R2lGcBIdt3XA9XJZ/CQZ4yy4RZLJCJASzMplMcPW3VeQ
         DzZg==
X-Gm-Message-State: AOJu0YyyCFNY76XWKreFFeZZu6g3yY9UnWFXsnH73qwcGFiLGkL7SXbn
	o8dyv6jVwZCnXUtc9Y+MzxyTWu1Q3eD7AXwSKeZtHZzORGROt4jm90l7NFUjSU+sg00QAnk0i1F
	x3GnGFLMbh46xQfhmZazuTD6dmzU=
X-Google-Smtp-Source: AGHT+IEq523ZGzm1uYCSNnOpZMmJtAQOgkeNGMVJkSPe0LQY3MF2AVkvm03zV0ZLUC8FfTySQIYZe885wY4xNMV7CGs=
X-Received: by 2002:a17:902:e54d:b0:201:fd52:d4f0 with SMTP id
 d9443c01a7336-206f05b1585mr181596725ad.47.1725913628640; Mon, 09 Sep 2024
 13:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240905181803.94127-1-theo.debrouwere@faytech.de>
In-Reply-To: <20240905181803.94127-1-theo.debrouwere@faytech.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 9 Sep 2024 22:26:57 +0200
Message-ID: <CAFBinCD40ReJ7U0ka09xLQXJYNx6G538H19T++ZY8cdzR4yi5g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson-g12-common: fix uart-ao-a typo
To: Theo Debrouwere <theo.debrouwere@gmail.com>
Cc: linux-amlogic@lists.infradead.org, 
	Theo Debrouwere <theo.debrouwere@faytech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_132710_090833_2B06E2B8 
X-CRM114-Status: UNSURE (   7.42  )
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

T24gVGh1LCBTZXAgNSwgMjAyNCBhdCA4OjE44oCvUE0gVGhlbyBEZWJyb3V3ZXJlCjx0aGVvLmRl
YnJvdXdlcmVAZ21haWwuY29tPiB3cm90ZToKPgo+IENoYW5nZSB1YXJ0LWEtYW8gaW50byB1YXJ0
LWFvLWEsIHRvIHVzZSB0aGUgc2FtZSBuYW1pbmcgY29udmVudGlvbiBhcwo+IHRoZSBvdGhlciB1
YXJ0IGRldmljZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUaGVvIERlYnJvdXdlcmUgPHRoZW8uZGVi
cm91d2VyZUBmYXl0ZWNoLmRlPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFy
dGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
