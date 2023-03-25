Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D5AC6FD1F
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Mar 2023 13:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7KltdGBTWDxqgv7y99vYv4v1Z61sKlijDae3zlGfT8Y=; b=idNW/rpr29oRL+
	x/++cQtXzeclt3Eaum4kqdO31BLgU0VhDEfqw4d1rWJrTP8Q96+hBM1URZkDNYWCUMZa6dvQB/Tjl
	T4YeWIZpEIzk6+uOD7K/Zi7DkfxsqpIWhS5cGvpkxmfctTaIOG48adiVCyxkiEOoOEfcyZaeD3T0f
	O6xyG1+IcZmliNfLW8B5pDxcCZ6W1cU/Rhr3RthJNyH9WX5t6l2l0Cj3yfkwN1LeSXGTe7aAyesef
	3W4I6Sc0wHc1R1kZty3EdWey3/frYaA2T+mw+oHNH+pmjmIDOUNhhINcbLKpHB1sRMUHsKi7gcMg3
	FpW5TDqBRrLCEGfeio6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pg3eW-006jFe-0u;
	Sat, 25 Mar 2023 13:09:48 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pg3eS-006jBa-1e
	for linux-amlogic@lists.infradead.org;
	Sat, 25 Mar 2023 13:09:45 +0000
Received: by mail-ed1-x52a.google.com with SMTP id t10so18045461edd.12
        for <linux-amlogic@lists.infradead.org>; Sat, 25 Mar 2023 06:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1679749784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BivoLDf3VVsPCNHpqkq3yz6m8MDZznemKX2EBNEZN08=;
        b=JzRDixDW3uR/Ix337Eclo3haZk+PznJW8nHzW5WJUNXRm6KRixGO7jKbBqVbqlGFhj
         bEbIw2DuKtOWxwf0oL+iRtWdKqApXAeeF1YwfOkKgtJHu/9WTTL74Vfa24X7LCSirV+A
         VBm8LtvCwAGIa2zZt9g89FvJfGJ87no4ryc8eHxzDPZ/vNqaB8BiotjZMR/dWJa5fkC+
         CEcmo+4ukDpxB3HbcuwDzpn4qStoDLqmetmYLQL1mLdKTHzu9JKHOr4HzygXLtHDl4xR
         Vs6rIGvjlZGE29L1dShqw0opIjvPcbuaQ5+WR/DFyIVkjeMXbQ41mCoTA/2SuDswJRxO
         OWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679749784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BivoLDf3VVsPCNHpqkq3yz6m8MDZznemKX2EBNEZN08=;
        b=tIMBJm3kckR+vjeZ1RfEULRuvxnuSVcLIMMZ3ainCnoVJYxs+Hi48TzAHcuU4geHSB
         SQCFnnj8DmknoLZ7G1/htQIpxbJINkEvR9xo2SH8Jm5IgHdm2N0TTQQSdGFHdxAvcbUh
         xcCwOVpuxD7R6J9DQvdjlZpvLPcTLPAQkEmkieQzIwzInpZs7JIaaokPylHOjT9EODf6
         tWWF8xiWh3EY/bpZkwwTLir9ytPgRsJTdxMRdONHn2v2SkaZs7UNsWybk/I9m9fVUQOy
         rIb0KY04ahsInRVTLf6VKhTzwMwcmnqzbpEhFEwf2L9c8hF+PXEK0YiDrikg3JHiDysR
         dWtw==
X-Gm-Message-State: AAQBX9ddcB2OoqAcxmLSGRS40gHUCIeLaHDogadDOybIbG2nm71/DW52
	gKAQ8nO3isZ56CrUMFzyWN1tcBvpkacvGZO/OjY=
X-Google-Smtp-Source: AKy350b73vFj+pZqqUFZhR/pREKA9FiHjczT2L2Xv6G8L8igOFUG8aqx2VJ1hJgYhHMVBooRxexmFVqke1rOYDNcQow=
X-Received: by 2002:a50:8acf:0:b0:502:3a4b:1f1a with SMTP id
 k15-20020a508acf000000b005023a4b1f1amr423545edk.4.1679749783823; Sat, 25 Mar
 2023 06:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <202303241020110014476@zte.com.cn>
In-Reply-To: <202303241020110014476@zte.com.cn>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 25 Mar 2023 14:09:33 +0100
Message-ID: <CAFBinCBCdW5Nt+cm_1E-6gG1UNv7mnnDYxQRGae_UtCigt0+uA@mail.gmail.com>
Subject: Re: [PATCH] thermal: amlogic: Use dev_err_probe()
To: ye.xingchen@zte.com.cn
Cc: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@linaro.org, 
	amitk@kernel.org, rui.zhang@intel.com, linux-pm@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230325_060944_546193_0241BB0B 
X-CRM114-Status: UNSURE (   7.16  )
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

T24gRnJpLCBNYXIgMjQsIDIwMjMgYXQgMzoyMOKAr0FNIDx5ZS54aW5nY2hlbkB6dGUuY29tLmNu
PiB3cm90ZToKPgo+IEZyb206IFllIFhpbmdjaGVuIDx5ZS54aW5nY2hlbkB6dGUuY29tLmNuPgo+
Cj4gUmVwbGFjZSB0aGUgb3Blbi1jb2RlIHdpdGggZGV2X2Vycl9wcm9iZSgpIHRvIHNpbXBsaWZ5
IHRoZSBjb2RlLgo+Cj4gU2lnbmVkLW9mZi1ieTogWWUgWGluZ2NoZW4gPHllLnhpbmdjaGVuQHp0
ZS5jb20uY24+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVu
c3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
