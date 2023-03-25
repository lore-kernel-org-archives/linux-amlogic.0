Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0E4C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Mar 2023 13:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Ln6u9u/Uup5w+bb10jz8t7xK+us1k/+lRhaxNlaoFU=; b=FKPIIuPQO6H9FE
	mV6EaelXECFIc9jPFKnAvOBZDbsTevZ0rFTuJbiJaYS/f64BxXbqQm+PLG8p9Lmddsx257boA3+G+
	REBBNKXDw9B6W4ebEM3T63W5tD5xnQKqAnAW/aTfS5ohsJ6okwIXm5iAAnvTJ8bYs2EjyBt6Kvm2k
	WfSuFcry6A/AIxiFCsb8aa3tliCylP/u/yaeo937AxL1bVWQXc252/ZXJciNiClBs3+dFH34m6QBf
	GJZXk+m0dgKTuLC4ba55rDwH9Us9+QFiz6xBCkVhmVooB176Ws00BKm2nS84nB4IRG10b2OLSMzMu
	eSsWZ59ZFtyuz8rxN41A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pg3ru-006kHp-1H;
	Sat, 25 Mar 2023 13:23:38 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pg3rp-006kEx-3C;
	Sat, 25 Mar 2023 13:23:35 +0000
Received: by mail-ed1-x52c.google.com with SMTP id x3so18151735edb.10;
        Sat, 25 Mar 2023 06:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1679750610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFyfxphW4gvszJfcIGrc1v0R57k+ZcqgbtKUyxLAwbU=;
        b=NomjSO7qGeMpJDE1nbxVgLfwRozzp1CpZfxfh/2s6FtAd20KieLu5TtFIsgwd6BsA0
         kJj4+YFjt113qu6vqkgVlYTUDskjGTkBzh9nzbd5Yj6eQFbf8g8dOE44+FLLwJ8FMLzJ
         YnMLksGI7QV5g46ZXT39FdZDAZ9DfZ2lt6RtR31qdEQ1NKSSd58m2d2KRMJaZgaL8/fk
         NJBc+uajxaOD6TJcsDKyoy/DCRJnJa7QCqwdZcdN7B5b99IvRwdoY/5s/hlM6eCyBAbC
         RwQa4+AxMjoOLQGzSsptvy4wlYxmWLfpC5ktJ2V4fh0QbuHZxYuSyelENVoFQD5kthuR
         mc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679750610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFyfxphW4gvszJfcIGrc1v0R57k+ZcqgbtKUyxLAwbU=;
        b=VFyqYiQoqkG/PxvpUSmrsug2xjSYqWNTdt6li4wz9Ahrbd75UQd6LIrJ1c/ykpDBiV
         gzZONeOynthmXlTFEk+6jC1SP99LF9mJsGYrhwRIMqSRxvoIZTU2cB+GH2fw6tVr3XsR
         DvwkUVTax7L0o3PzXwUQ56xf2Fb7qUsXVdexvhp1LGCtK0a6sYGDr3keTqA1gvOSjX2F
         3xLCJj3p/oPLmFPkIoxUG4sFLE+GpKY7zmFfjW4bE8xXHzRRFgR+kB4CnV6ECSmHdab6
         3Q9aygeX5m6RX5l/2t2WBrVMyCNxaS663Lhr8EiHxJTL7AnrIsZgdVK1JO7ybcjhXIt1
         aIOQ==
X-Gm-Message-State: AAQBX9dQmQE+7Bq/J5f1sFlf4RBKKN1ZEQkrvzrjO54Mzq2TG393opTs
	BMBSyi9ihRGlFqLC9aiIjdNgUkdf0K6oytmTcSV7d0f3gYk=
X-Google-Smtp-Source: AKy350ZMHH5sGbdKzT92r0uk3rX6oQerQpXRjZKBGPm6vM90ZYoPTUzVvyQb5zMM5GyPxrAOsXxCPAk/SNPAlAcid9Y=
X-Received: by 2002:a17:906:cf89:b0:932:4577:6705 with SMTP id
 um9-20020a170906cf8900b0093245776705mr3103282ejb.6.1679750610139; Sat, 25 Mar
 2023 06:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <202303241016261854322@zte.com.cn>
In-Reply-To: <202303241016261854322@zte.com.cn>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 25 Mar 2023 14:23:19 +0100
Message-ID: <CAFBinCDMwBvM=KWAMQCVmAOcuPM6K8BwuU=zKOd-7Qv9ob-cNg@mail.gmail.com>
Subject: Re: [PATCH] soc: amlogic: meson-pwrc: Use dev_err_probe()
To: ye.xingchen@zte.com.cn
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230325_062334_053379_58A76791 
X-CRM114-Status: UNSURE (   7.41  )
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

T24gRnJpLCBNYXIgMjQsIDIwMjMgYXQgMzoxNuKAr0FNIDx5ZS54aW5nY2hlbkB6dGUuY29tLmNu
PiB3cm90ZToKPgo+IEZyb206IFllIFhpbmdjaGVuIDx5ZS54aW5nY2hlbkB6dGUuY29tLmNuPgo+
Cj4gUmVwbGFjZSB0aGUgb3Blbi1jb2RlIHdpdGggZGV2X2Vycl9wcm9iZSgpIHRvIHNpbXBsaWZ5
IHRoZSBjb2RlLgo+Cj4gU2lnbmVkLW9mZi1ieTogWWUgWGluZ2NoZW4gPHllLnhpbmdjaGVuQHp0
ZS5jb20uY24+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVu
c3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
