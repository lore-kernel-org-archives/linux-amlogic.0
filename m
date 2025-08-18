Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63301CA0EE4
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Aug 2025 13:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/2+pUOwr/G9JjZU2sA1sscsd7Tya/6P/YB/k2a5LM0=; b=bK6fyVKna7+JIM
	qK7ug8oBgIDlW1lBLfV3SD/mF2MDrpLOy6sFbQETowCAOF6XQNSGOJJPhTTOIJKWXPANRvw4wFMrJ
	ftU2UoD2LdXpZubEshBr8/rs1/W1yEPbb/2EX27VlZqE8U54zhZbmlX6kRN62VyX+aCfPmbahScTC
	+ZHVQ6Nr1MNZcM1OGJWGWoKPBFjIM8w/dVMD0dgaxpDczdyDergVaUZJ3DIB7btzy7YG+K12ZnJpF
	iQfq0FdUnhhKM5cjkdLz9cM5BeEskxg3frCBw/Pl4g5iAgchC2s7TdLkKdAyz1nEG/8kOVTAm2rdp
	qB4tPWK2QdBRPIgMy5BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo05a-00000007Xy5-1ouY;
	Mon, 18 Aug 2025 13:39:54 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvtx-000000071V3-0v6i
	for linux-amlogic@lists.infradead.org;
	Mon, 18 Aug 2025 09:11:38 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-333f82a3a9eso34170821fa.1
        for <linux-amlogic@lists.infradead.org>; Mon, 18 Aug 2025 02:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755508295; x=1756113095; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcnZxDmddaN0uXNCAKklDD8KhKB/8VIRPzW44qoA8sE=;
        b=EuRY+xmJydTwyHy1KCTzBwZqcarTConGYAr3JcxqvAL/IfcyRTW01aopfHd1qZ/LYp
         C4962NTYk8AL797a/vQxv7Y15RWJUTPeWC4Gm4u4eU5zcbvPrBIHqx1CpYZWaJZtlYa4
         r1I9yI8mYeCSkf5PVJ5bVSKGfKaGxqPRTw5Q9Oh2yAA2j1bKw934hgzEQlZrJBBcgIUr
         W5ZL2wdeJ1+j74zuAcWfjbBls4VKMEINfN8OGfqYEeUfms7xH0XIiQmXQsVQAMyi3bxX
         r/NjDj/Orw0GjiLT93YXW97RnTb9WIOHi2Sa3Ia3BqQYZIPofJNZy7hq0t+ihfUanMp1
         Bg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755508295; x=1756113095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DcnZxDmddaN0uXNCAKklDD8KhKB/8VIRPzW44qoA8sE=;
        b=lIAtFJEn2zU1q3GClG/DwP6kWj6ltyCmTLk1K1qZ/hteZcij6HsyMFT45YkWoYPuT2
         8CQuPwP4bmS2bOXLnjZu4vVR6gd1YgR4YbkyrpMMv+tbuEzL6unjNBXKa8RjkbuXC88q
         F6VM0VZyzh9EUW9xaZufFqkpO+58rZtB0odl3xuIQai8iNsXy1qqivgu04lUzwHmlxBb
         uKzJR/XqXSAjreAgRhO5i8nmKYU4/QBJVZaT5UQrlIcc400uFnBdRUbBRBh7gW5RheCb
         TKmfP4iJtCz0WE7H6kWQmmmK9hiXwI3YlnYDwN1GGfSqnNSOAhFv3iizgpskDTRInZ/n
         uo9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDezOFK3CCqBRCUkcj6ZegV+ejJd1dESB7sgApuywySZHeybw+uw89gJvwwXuVlP4uOSxeQh6RpZa3p1S1@lists.infradead.org
X-Gm-Message-State: AOJu0YwSbo3n/RovkX2b4nT1Bx+jtDRLgjfP2Nd8EGe0iZ4Set9v8Uc7
	FC5DZByK2ayFHW+u0lRz16BGak68tDiyxIixCyXgoX//dwZw8nXQg32Bu4M20DFO2MzK5l1Wkjp
	SaxcnPCZP3jIGVN6aiRnhsUzB2rzm8FDefKSFO0PPWQ==
X-Gm-Gg: ASbGnctHkrKPgiOId/6TwOhKgGKtaMvtV8KerkoQ5WGqhBEcrPumXCnVwgA5CVpC7Rw
	S5YhgmBuqaIF6uwuWM3vfMqtd8AwMOUUPPjAOreQiWN5ALFTl1lyAWUFCSzW3Y0nDBOEHYmnn5I
	85YHBr3oqlnjW7nqPihDnF1gtLRDQa3+5GuSkSnKSQChowaTdZ3fTGK+6MX+MNvmz8Fv5LvUrOJ
	jaJUzoe4mq8
X-Google-Smtp-Source: AGHT+IHgT6KsRzSnbopUtkS8cEhRfVfJ0+AHWqYOh3gWL/IW0zk5pe+bot9eWtYj+gnQIC499kzORbuEnGkUjOVjrWk=
X-Received: by 2002:a05:651c:e0e:b0:32c:be6e:6719 with SMTP id
 38308e7fff4ca-333fac4d04bmr33701811fa.1.1755508295256; Mon, 18 Aug 2025
 02:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755170493.git.legion@kernel.org> <e548b7761302defec15aa2098172eabb1ce1ad4a.1755170493.git.legion@kernel.org>
In-Reply-To: <e548b7761302defec15aa2098172eabb1ce1ad4a.1755170493.git.legion@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 11:11:24 +0200
X-Gm-Features: Ac12FXxtga8FCHwZMpHGt8XLiCGvlV2q8kZWzSqELDgp5nsspkpj9rrMqCjq2Ao
Message-ID: <CACRpkdZ9oyJ4aJ5Dcp_Dtv5qoiSo+g5cO7Uf4PmHgv_Z423onQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/9] pinctrl: meson: Fix typo in device table macro
To: Alexey Gladkov <legion@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Masahiro Yamada <masahiroy@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_021137_261910_C3D4116B 
X-CRM114-Status: UNSURE (   9.06  )
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

T24gVGh1LCBBdWcgMTQsIDIwMjUgYXQgMzowOOKAr1BNIEFsZXhleSBHbGFka292IDxsZWdpb25A
a2VybmVsLm9yZz4gd3JvdGU6Cgo+IFRoZSB0eXBvIHdoZW4gdXNpbmcgdGhlIE1PRFVMRV9ERVZJ
Q0VfVEFCTEUgbWFjcm8gd2FzIG5vdCBub3RpY2VhYmxlCj4gYmVjYXVzZSB0aGUgbWFjcm8gd2Fz
IGRlZmluZWQgb25seSBpZiB0aGUgbW9kdWxlIHdhcyBidWlsdCBhcyBhIHNlcGFyYXRlCj4gbW9k
dWxlLgo+Cj4gQ2M6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+IENj
OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gQ2M6IE5laWwgQXJt
c3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+IENjOiBLZXZpbiBIaWxtYW4gPGto
aWxtYW5AYmF5bGlicmUuY29tPgo+IENjOiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBDYzogbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmcKPiBSZXBvcnRlZC1ieToga2VybmVs
IHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9vZS1rYnVpbGQtYWxsLzIwMjUwNzIyMDAwOS44SEtiTlAxNi1sa3BAaW50ZWwuY29tLwo+
IFNpZ25lZC1vZmYtYnk6IEFsZXhleSBHbGFka292IDxsZWdpb25Aa2VybmVsLm9yZz4KPiBSZXZp
ZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+CgpUaGlz
IHBhdGNoIDUvOSBhcHBsaWVkIHNlcGFyYXRlbHkgdG8gcGluIGNvbnRyb2wgZml4ZXMuCgpZb3Vy
cywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
