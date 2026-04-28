Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775C6FF885D
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Apr 2026 09:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdyKBeupvxxVmt3wEQmAmE+GYikuBOXVrjSiO7iecuM=; b=YBf1NrXwjuqlku
	BtMKZw0mPQ2BJcvrtpV+IP59rn9soDV/mQX3b9JMwXttPJNudDKLRkAhwjn7uuFsUgtkrJe00LIFq
	NQjs8wZp2SSdgKJs9OAUCJHv2KPf8zgw4A1aYJCOqXPw+FgPcqYjx16amDl9FEUOpmiUkDzediQYz
	yHdYZAafVQkDimCtj+Q6M0u6M499zW6NWt+lGVirMbX7qMoE617fPWbJJbbE/rDEtfn0dBTgBO73i
	s4sabWZ6omvG5RMYNy7kJfYfMBtOBhLqjodwkdOnaLLuEUadoQOlc+WHBT24LmAaefo8mCMx4i6oA
	Vlm5SU+JUKl5UguQIiZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHf5m-000000017UD-1B3m;
	Tue, 28 Apr 2026 09:50:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHf5l-000000017TV-0ZZl
	for linux-amlogic@lists.infradead.org;
	Tue, 28 Apr 2026 09:50:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CDB361119
	for <linux-amlogic@lists.infradead.org>; Tue, 28 Apr 2026 09:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E2AC2BCC9
	for <linux-amlogic@lists.infradead.org>; Tue, 28 Apr 2026 09:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777369856;
	bh=BC5O937iyiNhZiumC7m5YAaGDlwXTXa+qfnkEp1/d6s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UQtxjLVg1H6w9ZPEXKijvwyGG6ju7AzehKsOQ6wPd0LdvjGrdaDkvh7muB/WuNrEj
	 Owd3ylY8hw7DjW84ipQ0VtocZQFcnsWfSG71KBSzqjaX78OHTdxQTS9c/FVIlBTmlR
	 yS1oagKHMkXQ62yIeEAEwgEyleo8hWIH5WVlPI0UwjC29YUoNcl3BSg3rJ366m/te3
	 3aGRWkc6UWICb2ZoUwPMq2yFFFzTpGO5Go5kJf8PKMydfWnnRadIEq3MSN8JxzKU+g
	 civbJHg8g6sdcuauwVXRPo3/efh/DcesNQJWT4nNJPPHSKqyE8PDImYcV6+ujdhYBb
	 1U8k2rq3Pju7A==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38e84ed22bdso105831801fa.2
        for <linux-amlogic@lists.infradead.org>; Tue, 28 Apr 2026 02:50:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8K4msqxq1dWDFBlumrbRMO2m/N8ajjKbgJ6ioumzEGO+a0CYsEVPYop5QlJ5erCgoELQVAe9PTEJ4nuN5m@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/5PJRtnqd2Tm2YfrEmPbtU9oA7g99lZ/dtqnamKP7fO4w16ug
	t1uGW3P4P5cKHumjdzmOFjz/fzkti0FfUttrk6e+ba4Yloy9ewBoea+Hcw8o3+ZDubQDrYpDVul
	uoFiHoiY7lz9nBIVti6FVTBI5yJqMRQ4=
X-Received: by 2002:a2e:bd12:0:b0:38e:d78c:b16d with SMTP id
 38308e7fff4ca-392411ffeb9mr8148211fa.29.1777369854861; Tue, 28 Apr 2026
 02:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260422-fix-pinconf-v1-1-abb4d2e0da55@amlogic.com>
In-Reply-To: <20260422-fix-pinconf-v1-1-abb4d2e0da55@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:50:41 +0200
X-Gmail-Original-Message-ID: <CAD++jLnKjhw7xhSwg-b0DNm+SF000wCFKVWsmt_5bN=CCpfP1w@mail.gmail.com>
X-Gm-Features: AVHnY4KHYfTu3c9NjEh7-gGu4G_oPSv4ZkBHrghlIhCkbK9VzyhYmoslSQdRSM4
Message-ID: <CAD++jLnKjhw7xhSwg-b0DNm+SF000wCFKVWsmt_5bN=CCpfP1w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: fix deadlock issue
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

T24gV2VkLCBBcHIgMjIsIDIwMjYgYXQgMTo0NOKAr1BNIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVs
YXkKPGRldm51bGwreGlhbndlaS56aGFvLmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgoK
PiBGcm9tOiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPgo+IEFjY2Vz
c2luZyB0aGUgcGluY29uZi1waW5zIHN5c2ZzIG5vZGUgbWF5IGRlYWRsb2NrLgo+Cj4gcGluY29u
Zl9waW5zX3Nob3coKSBob2xkcyBwY3RsZGV2LT5tdXRleCwgYW5kIHRoZSBwbGF0Zm9ybSBkcml2
ZXIKPiBjYWxscyBwaW5jdHJsX2ZpbmRfZ3Bpb19yYW5nZV9mcm9tX3BpbigpLCB3aGljaCB0cmll
cyB0byBhY3F1aXJlCj4gdGhlIHNhbWUgbXV0ZXggYWdhaW4sIGxlYWRpbmcgdG8gYSBkZWFkbG9j
ay4KPgo+IFVzZSBwaW5jdHJsX2ZpbmRfZ3Bpb19yYW5nZV9mcm9tX3Bpbl9ub2xvY2soKSB0byBm
aXggdGhpcyBpc3N1ZS4KPgo+IEZpeGVzOiA2ZTliZTNhYmI3OGMgKCJwaW5jdHJsOiBBZGQgZHJp
dmVyIHN1cHBvcnQgZm9yIEFtbG9naWMgU29DcyIpCj4gU2lnbmVkLW9mZi1ieTogWGlhbndlaSBa
aGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+CgpQYXRjaCBhcHBsaWVkIGZvciBmaXhlcyEK
CllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
