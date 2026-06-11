Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC05CD98CC
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jun 2026 12:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LRc3TJxwx3Gi6Q2QQEhFq3nEfoOZJtU98rcZcFg0srE=; b=poLjR618Prr/Iz
	11K6sJ4x6sF7B+pE8VDegdifucz73LNytGKGb0QnxogAvPQuPti2RCnQNgEAuD1ZcC+1SH6VaJe0M
	u1+by7k6w4ud4ZeX8byA2yZgy90aHMs+etNJ4XlErnv4i1J9oWOjKMt6YzxClY73tpOz9w+Vi+8iH
	OQTQaPwEiqxDLZuZsnxqrnZK6Pp3P375wEl0AX70SSlScgAynN/83FPfXh1aqE8gQJbVQs8CnkS1J
	HaYXhgXBiFinTDC+4bFt6oz/24y83EPgO/YER+MIKBuUjlZEyJw22L9LZUyFCyUhH0sOPtN28Ihkm
	OisE0iiHRtbYO1PClE3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXei3-00000009QRH-2chd;
	Thu, 11 Jun 2026 12:40:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXei2-00000009QQm-0Ohm
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jun 2026 12:40:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CA62B444F7
	for <linux-amlogic@lists.infradead.org>; Thu, 11 Jun 2026 12:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8611F0089F
	for <linux-amlogic@lists.infradead.org>; Thu, 11 Jun 2026 12:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781181633;
	bh=2P4PmcnHeSIbmz3J0AKO+3ABrN1m7BkMBBGbKGlWimI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LgQlvCWzASZTDlq0M7janNNq4Rs04qI0YUVTvm7Pdf217QxM67HdfmkOPdgsI9GKe
	 pmQHAtyP8EbJxZP7OxnPk0Jtwb/2YZgVcAXoucTJZxfsRLwytLYqOYVut/GyXyFliR
	 ijAOJK7JZmFPRK3TdLPcUIwALIzlsX6ejpg5qBCtuXSKbiFBo2O+sg7ahouw3f41pO
	 58kz5LC91v2Ow94piAcNf7ZSRarXBzzSN/EP2U1zn4nmTDBaoy0V5naZ0bNkb+bfHm
	 g7UegBC1dtidkYnX1o1RFivL49JeOJBKvlFvSVevzxo1K/9rztcSgaoZC5cG8RE4DU
	 MVGdyiwzIbijQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa68d9d4a3so8996699e87.2
        for <linux-amlogic@lists.infradead.org>; Thu, 11 Jun 2026 05:40:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8iymSK2HjIXDSVnqU4Kw5O25GmLaBE8M4BHiMy1R1ee+w89nSianSUQcomZsrNogYgQO7uzyNZtp16Poks@lists.infradead.org
X-Gm-Message-State: AOJu0YzU0N8G/PpsWD7E+KQspnxakkoApE8a/Bsr0gflS+I5DcErsuPI
	GlLqv40B+pKcI/r7buvGbG70vQrnJUiOpgDGds7a5QBoQVbgruiWyfkQa7k2Nvm5S+KDZ1iwk/8
	ZIH+pU0nGsoTcd230Y6Dusk5365uxK1c=
X-Received: by 2002:a05:6512:118a:b0:5ad:229e:3860 with SMTP id
 2adb3069b0e04-5ad27aaf3c0mr778501e87.3.1781181632448; Thu, 11 Jun 2026
 05:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260611-pinctrl-nolock-v1-1-aca022d4d60f@amlogic.com>
In-Reply-To: <20260611-pinctrl-nolock-v1-1-aca022d4d60f@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:40:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLmdCCYTKv+J09pS=49c4y19stBYmBgytc2SG_MM4D=ABg@mail.gmail.com>
X-Gm-Features: AVVi8CcK6vKj7M9lrxTHVvJAMkxnXvUH3E59BGUGT9lSHYyOacydnWB2IyiXFRI
Message-ID: <CAD++jLmdCCYTKv+J09pS=49c4y19stBYmBgytc2SG_MM4D=ABg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: use nolock get range
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

T24gVGh1LCBKdW4gMTEsIDIwMjYgYXQgOToxMOKAr0FNIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVs
YXkKPGRldm51bGwreGlhbndlaS56aGFvLmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgoK
PiBGcm9tOiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPgo+IFVzZSBw
aW5jdHJsX2ZpbmRfZ3Bpb19yYW5nZV9mcm9tX3Bpbl9ub2xvY2soKSBpbnN0ZWFkIG9mCj4gcGlu
Y3RybF9maW5kX2dwaW9fcmFuZ2VfZnJvbV9waW4oKSB3aGVuIGNvbmZpZ3VyaW5nIGEgcGluIG9y
Cj4gc2V0dGluZyBhIEdQSU8gdmFsdWUuCj4KPiBUaGlzIGF2b2lkcyB0YWtpbmcgdGhlIGxvY2sg
YW5kIGFsbG93cyB0aGUgY29kZSB0byBiZSBzYWZlbHkKPiBjYWxsZWQgZnJvbSBpbnRlcnJ1cHQg
Y29udGV4dC4KPgo+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFt
bG9naWMuY29tPgoKUGF0Y2ggYXBwbGllZCEKCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
