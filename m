Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1818DC3ABCE
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 May 2025 20:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ydeLPYpHCMUlgcYk/rxWu9T4LVS/6z6c+uPknra3nQ8=; b=3gox1c69+u+kBj
	G/A21lmyW+QzDHWsVVp/z77zINZKWuwhNuSxICFKGqBa0f1dBbgoS0B8Y43JFyeZ6NMWVEplJz2Ui
	/SC3JkSJrFRj9zbCHupuCcU6eEg2h9S4I1DH7c4RnHP6wslQelU0h3t9ksMH4/LB4lfl5TGME2oSM
	rc/dn83MrtQgenOBb6z4VZM9Dvf7CQmrE0nC0ekRp82u2Yk8/6h3frybwwY5Jlr5rOSFm71RZ730u
	SF3jcPn1WzmSk7NHUbQ0shh11av5eQO3NaMPR9kTSckn3fULtgCIQDbK2UKMvKT5RleMQUK9tts20
	NjXKekNro1ph/l5siF7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUJw-00000004p08-3O4R;
	Fri, 09 May 2025 20:27:48 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSS0-00000004Zdb-3ZE8;
	Fri, 09 May 2025 18:28:02 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22e661313a3so23658395ad.3;
        Fri, 09 May 2025 11:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746815280; x=1747420080; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGMDR4vrCsmFK5oEVJjhbe9GdCx3AVSX7y/0PLZa9DE=;
        b=Bzd75DUK0P1fC6uG0vDl3wkR7QPeveaNragb6D4slP/xMMkeJpB7ZSZIjLggnD7AM6
         IrdRc+F5xvl2VTcr4gD0vjAz7QH0mZwmHCOvq7djVgSD1D+Gr8yQT+TaeFDFlpxL2KrU
         Os2ZRdhut5LKufyGGearuvwdEHb4lAzCKgrV7l465V+3t+ybjMVMa9sdXbpJ/sI7cO1W
         LEE17TCpX+AkXDgRBKedKHk4B8woru4ZhBGh/JNMYw1CEANBhNrxBRukMWaPYeHvBW4H
         GUz1Fnwpz6ESVKRAoYnOjX/CYbNhHiFjoIV4w6+nC0BrC1fVWFMJCdDOVBZ1I5mJotCU
         n27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746815280; x=1747420080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGMDR4vrCsmFK5oEVJjhbe9GdCx3AVSX7y/0PLZa9DE=;
        b=CPvpjIR3I8NobeE8Ld7slJJJX+LjEmyRz1IGQsvwEjkgSk5DswnYjE00z9Ll4ElscW
         ambikVkAJygGH2n8clqcv9djeY8fLIKj+Sp1WE3v8Pw5scRvi9XPDPJ3X+185OAXBHjK
         k6Hf73vbx/dVD6Gw//wxZH92ULYYKIvT+CqZmBGro5+GlHB60ptsTfseaK8UimJ99hd6
         Gx+wYTLlieDE0LHvm1iSxaP0a1ArbXniI6stUi8NFv9HhVt/RS7e9Dp0zuvc39640VRX
         KZoT9h3fHYPs85XL4iOC3FCLxNO+GzUXvxg1hcH0AJ77herj3MVVi0ByIdD9psg9nbpZ
         SpTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbY+adHGhvOqq14teE9gDlV87kNHrSuG1KuJ7nj8n6q5unc/Cm7tg33hFWcOA++7HCB/2I5fhN7ddIQd9N7Taj3A==@lists.infradead.org, AJvYcCWB3i80oBcT/Jcs8PJ6WxWwOBi61BOs62X1c5ei+cB4q5a9UqasJTVaCYft4UsLF5dyrFtkbopjrkhEZXRJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwSuYP/OT+9PhW+2i44nhsceH7Bdzysp0MtmU7NutjSW6dTT+Wj
	NcWUcUIhzfmOwpkNNZcfafAf5JngbtdQq2oo4OAlLmuF0wH9zV4FrfptLehURPgvBLIjTVeAtr1
	c0Ng50oEFmEVlfHkhaXR/zk7W+QA=
X-Gm-Gg: ASbGncsz6QpnSeR0RBopaSlbxWZI5wuXvZTDOmvZmYescTHkJMYP0CKS3MQVs+b0UU3
	8TJW/VY5MHoXgAt3GH4IB0dL7X8St15oQaXCDHirHQ6odXdmZqZnykYo1MvBs6rTKYXuy/iNanz
	FWjjhXPFS0LwzfEJJ+p1w88OHUALeeoNAiGnPjdQGSNH9R8IMEUbINJ7ghWVxeAk/xLQ==
X-Google-Smtp-Source: AGHT+IHXDGWP+YtZpWiwJiGwLYqFvxGO5dbb7SWr+ooxT2b9DImqaiGMOG5CHnVu37yhFV5sw1lsNGEQqFB08eoyEkU=
X-Received: by 2002:a17:902:d48c:b0:220:d909:1734 with SMTP id
 d9443c01a7336-22fc8b32ce8mr71176355ad.14.1746815279648; Fri, 09 May 2025
 11:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250505184338.678540-1-richard120310@gmail.com> <6d2f35ee-1b33-40b6-b164-ab4480110e49@linaro.org>
In-Reply-To: <6d2f35ee-1b33-40b6-b164-ab4480110e49@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 9 May 2025 20:27:47 +0200
X-Gm-Features: AX0GCFux03CvY5ldQo8MgJxENVqxGp77YENyE8ZwpmGhXEQFNatCnqiqkcdNym4
Message-ID: <CAFBinCDmHhF7=-dutXT6RE9hVzfN3akLicGkQKw=Arm8bq2NKQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/meson: Use 1000ULL when operating with mode->clock
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: I Hsin Cheng <richard120310@gmail.com>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	khilman@baylibre.com, jbrunet@baylibre.com, christophe.jaillet@wanadoo.fr, 
	skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_112800_903750_D3A3730A 
X-CRM114-Status: GOOD (  11.51  )
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

T24gRnJpLCBNYXkgOSwgMjAyNSBhdCA1OjM14oCvUE0gPG5laWwuYXJtc3Ryb25nQGxpbmFyby5v
cmc+IHdyb3RlOgo+Cj4gT24gMDUvMDUvMjAyNSAyMDo0MywgSSBIc2luIENoZW5nIHdyb3RlOgo+
ID4gQ292ZXJpdHkgc2NhbiByZXBvcnRlZCB0aGUgdXNhZ2Ugb2YgIm1vZGUtPmNsb2NrICogMTAw
MCIgbWF5IGxlYWQgdG8KPiA+IGludGVnZXIgb3ZlcmZsb3cuIFVzZSAiMTAwMFVMTCIgaW5zdGVh
ZCBvZiAiMTAwMCIKPiA+IHdoZW4gdXRpbGl6aW5nIGl0IHRvIGF2b2lkIHBvdGVudGlhbCBpbnRl
Z2VyIG92ZXJmbG93IGlzc3VlLgo+ID4KPiA+IExpbms6IGh0dHBzOi8vc2NhbjUuc2Nhbi5jb3Zl
cml0eS5jb20vIy9wcm9qZWN0LXZpZXcvMTAwNzQvMTAwNjM/c2VsZWN0ZWRJc3N1ZT0xNjQ2NzU5
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBJIEhzaW4gQ2hlbmcgPHJpY2hhcmQxMjAzMTBAZ21haWwuY29t
Pgo+Cj4gQ291bGQgeW91IGFkZCBhIEZpeGVzIHRhZyA/CkZpeGVzOiAxMDE3NTYwMTY0YjYgKCJk
cm0vbWVzb246IHVzZSB1bnNpZ25lZCBsb25nIGxvbmcgLyBIeiBmb3IKZnJlcXVlbmN5IHR5cGVz
IikKCk5laWwsIGNhbiB5b3UgYWRkIHRoaXMgd2hpbGUgYXBwbHlpbmcgb3IgZG8gd2UgbmVlZCBh
IHYzPwoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
