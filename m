Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEEAEB64DC
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Jun 2023 20:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0kt2IrpCPOr2ROWMYvCwvddoRx4aoYY3Fv7ALSMUgzg=; b=CiJvzISANBU1Ae
	KrftfNqa32kvVNsCvVETumGlA59bVUQCQfghFLXDn+hhDSSLsdaoIM3P/oR85N+8LmlTCZZIP2GLj
	aqjuzMVB51CDl55YNbHuK51/T6U7vl6zyXByDZsl7s+vEQD8sIa4/VeTQEP1kHz5kre0ufCxvObmK
	INfJE0ojsbHavbAxID0yuWRlsb8Q3QEnE7J8v/zXpvz5CzLxTtJ7U25jtK4skukFyGXULs3IIesF1
	Cr4nQ53GJBLe+Ab6jU8BEhgxZkCAPjRqXSNWWCTU87UNY0KjBRyImYWnEDsW/QM4Iyjsp7pulafbs
	orDgQKmEnPNhuBamr5Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDWeD-008gId-0i;
	Sun, 25 Jun 2023 20:47:49 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDWeA-008gHy-0C;
	Sun, 25 Jun 2023 20:47:47 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-98e011f45ffso102130666b.3;
        Sun, 25 Jun 2023 13:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687726064; x=1690318064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AqFVIF9YfIBYb2CvrHHDuEqSvWmX+/UHXMYkRoIX+s=;
        b=DV0fQxhtxizfrMX3uu1W6cPFSovBnbE7sMjSDJtut5hLi292pSAOMKfV5GT8SNWFnt
         y6on8ZGRC9OjJB8ctc53gUApt9/YNintfY5SslcLS13Lx4Amw1SIDwKZKbVzr8KyPdhp
         DNu4bN0CwpzMutuCCUAppyLMO8ltVP+7yBShkx7/P3V0ezQw0VfGnif9jlXZkNbP9U6x
         3XMbHNAjTtH6o8tyRvbcDJi7P1ojXrC5b65BFD+XfGwx/nwjP4y/Ofyvz/8EzGZYe4Vu
         sBVvKAOyi/hiyQJjYafQgZLjvkRfATB1ad8duQLnnJr1C+DtMz639kttYIKKE+DptaHx
         78zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687726064; x=1690318064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5AqFVIF9YfIBYb2CvrHHDuEqSvWmX+/UHXMYkRoIX+s=;
        b=gSfWx8toULBabAGhOTxhegLGEK3UBvpMBPm36iccRlQa5vke/JmG8tfM9DTFafxw8S
         Y9Y3Ne0xhCl/LSeYZbErmNks1pbgn3fUqGknyX9PpI4f48sBP+NsaCYtygnGAJBoPd0x
         augUEG6Z62vTW9oSHPHavtnWi5UI5DbymVMU6SJ4fkSsbPUWQYj7MnbbpoKu4V2+ysnH
         6sS0mj2pzmf2N824NN37Hxhyx1LENeoFVgAGmYQ8HMcdwrzaqUSpg46EIVDl4+sKE2zp
         LTG9Q2T/HjoCgHza3z7HPpgEhwKyqUt0FBB7Am4Zv2pvDvr08ZBgkXvRi7nolrsI3cSh
         i1Hg==
X-Gm-Message-State: AC+VfDwPBfkcHvxVIre2ncciipKvb46HgbDTGfnD0cg+U8X4XgnGgu/b
	eOY6Kd4E/X6yjQ7ikEi+co3WDNOgV1TirynCyR1NojmqDsA=
X-Google-Smtp-Source: ACHHUZ4dJTnQ+e5HK62iMwxzgdg8edVG5dR+IlPYW/YhSwjjl+dJxjkTY/D2/YtWl6RZz4GhPmx9nZZ4MLpq36fvcTk=
X-Received: by 2002:a17:907:2d11:b0:988:8a02:4560 with SMTP id
 gs17-20020a1709072d1100b009888a024560mr15820644ejc.44.1687726063835; Sun, 25
 Jun 2023 13:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230622105327.77296-1-ulf.hansson@linaro.org>
In-Reply-To: <20230622105327.77296-1-ulf.hansson@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 25 Jun 2023 22:47:33 +0200
Message-ID: <CAFBinCAULmVZJ0Zt5J=kmr11qeudeYgf=57y9esCaH9M5jJLpw@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: Drop redundant WARN_ON() in the irq handler
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_134746_102450_EA79AF6F 
X-CRM114-Status: UNSURE (   7.62  )
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

T24gVGh1LCBKdW4gMjIsIDIwMjMgYXQgMTI6NTPigK9QTSBVbGYgSGFuc3NvbiA8dWxmLmhhbnNz
b25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBUaGUgaG9zdCBwb2ludGVyIGlzIGFscmVhZHkgYmVp
bmcgZGVyZWZlcmVuY2VkIGVhcmxpZXIsIHNvIGxldCdzIGp1c3QgZHJvcAo+IHRoZSByZWR1bmRh
bnQgV0FSTl9PTi4KPgo+IFNpZ25lZC1vZmYtYnk6IFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBs
aW5hcm8ub3JnPgpBY2tlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0
aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
