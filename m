Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C9AE810A3
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Sep 2023 08:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nfSVnXGNv5DbTJfVKYfrnHmLFKLXWcYiTHnDfNsWIps=; b=Qb5zdNcIql0mVO
	3O4wANxtYf1wxb0nlR25teGKmuM4uVQG9eRqtI2ZFf9qLVY+hnOv9clEke7DROU7BXddfAuN8t92F
	BVPopQOpj6bATbGH7iyJW0GhTk5rV/4388PuEUJwUl/xSd7KcRU9OPUEHv/ezqI/EPZ08LoFg2YOx
	C8GHpNeU7TIa31VNP10E4JVayxb3jiTZw2pDCYmQ4LFdTU/2GkOUmYrTMHrGvmy+/NfpgkRAAIGRq
	/1XU7cR1cJgZUKCIONkJAKCFTXzbS4vXMk0sDjRqXu8V3bOSxVFfjO7KlZVutTGoZErItXrooz7X1
	xqlRqp3lmpg8KCCw6laA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlPe4-000JRu-2V;
	Wed, 27 Sep 2023 08:11:44 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlPe1-000JQ3-05
	for linux-amlogic@lists.infradead.org;
	Wed, 27 Sep 2023 08:11:42 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-307d20548adso9180706f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 27 Sep 2023 01:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695802299; x=1696407099; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ckTbHwDfKzFbEI8tdS6hS5ynC3aqs1kXGK7gaHMXpc=;
        b=VEeTnwYd/7WJc6IhYFGUKQD9n7aN8Vb/YiBMWIvMjOOwqDFhzroOar4fci3fdgfHJ6
         szODDgiXO6z14kWgwzErMKSXywgJNgLWGLui11fbQjAa79VRvTRfGk1f1v1REHzFIGZR
         8om2abW9deUb8xyfZUJPHGq4fPYS0HacLJZbgDpO04tQ3LlmS0pG6n4C5l6vPh5A7+iA
         RaF5BRsJ+8+Ke/EaLyqYrWhxEGlSd8L2h8NIP2bYwnBpLh4s2pIzMrtNc4l9RIDVQw3K
         NqNnhUO4L9cEcd1YbQB0oT45NsQ24RV3PzCe4UUFdG/DhS6fY4ifY9NWPsXukrPY4sOC
         tJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695802299; x=1696407099;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ckTbHwDfKzFbEI8tdS6hS5ynC3aqs1kXGK7gaHMXpc=;
        b=RheVmhexowCnxYzLbG7zwGyVr9YSxPu9jh5jX3IVU8lLNwsOzvgtJOS9H8qmpau97Q
         PGTU2i244ErjuPqhKnBYnsFd2vYGviA88g4iJEAPbeWsX/mLCpvKrcZgrAuYiz0dZcya
         DKTq17C7Pj6+jkQmSjTLOBq87z+O71sr8f+fS6o40jAF2wzOOm/LlT3Y2gD469kO+MuA
         dcKQj7woR6Z/W1Rco7roqT80+byJGW476o4VaOgBLmh9STVTrSJJP1rNEu2a+NXFzgs1
         Xos5HwLTjg52joPUzPhodfCMhbF2DQAuH7oMgG/Sl1e2ykjSNwqCphGwuvPYi8N2lkw6
         vJbA==
X-Gm-Message-State: AOJu0YzfISFx0Vqx4xYG3j5SrVLF3e1iw/BCNrpLtsWPCp+yduXpaRLN
	ShExrL8C4kZJd3p8lI23313IUw==
X-Google-Smtp-Source: AGHT+IF2l9Sai5n3yixiIddWbof/CUWzBiu0+9NTPTJD2EieajhSUDrqyEmJt8yl5o/Ukr5g9z8moQ==
X-Received: by 2002:a5d:4ec1:0:b0:321:504a:bc9a with SMTP id s1-20020a5d4ec1000000b00321504abc9amr775399wrv.71.1695802298786;
        Wed, 27 Sep 2023 01:11:38 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id b15-20020adfde0f000000b0031c6cc74882sm16621381wrm.107.2023.09.27.01.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 01:11:38 -0700 (PDT)
Message-ID: <c45df003-43fe-8ec1-42dc-9f688cc24acf@linaro.org>
Date: Wed, 27 Sep 2023 10:11:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: (subset) [PATCH V3 RESEND 0/6] Power: T7: add power domain driver
To: Lucas Tanure <tanure@linux.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
References: <20230911025223.3433776-1-xianwei.zhao@amlogic.com>
 <169444496123.3944766.3763051739383485051.b4-ty@linaro.org>
 <916aea7d-50ba-45d8-9b3c-0f507c922601@linux.com>
Content-Language: en-GB
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <916aea7d-50ba-45d8-9b3c-0f507c922601@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_011141_065270_9DFA6C2D 
X-CRM114-Status: GOOD (  19.17  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTHVjYXMsCgpMZSAyNy8wOS8yMDIzIMOgIDA4OjA1LCBMdWNhcyBUYW51cmUgYSDDqWNyaXTC
oDoKPiBPbiAxMS0wOS0yMDIzIDE2OjA5LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4gSGksCj4+
Cj4+IE9uIE1vbiwgMTEgU2VwIDIwMjMgMTA6NTI6MTcgKzA4MDAsIFhpYW53ZWkgWmhhbyB3cm90
ZToKPj4+IEZpcnN0IHBhdGNoIGlzIHRoYXQgcmVtb3ZlIEMzIHNvbWUgcG93ZXIgZG9tYWluIEFM
V0FZU19PTiBwcm9wZXJ0eS4KPj4+IFNlY29uZCBwYXRjaCBpcyB0aGF0IGFkZCBkcml2ZXIgdG8g
c3VwcG9ydCBwb3dlciBwYXJlbnQgbm9kZS4KPj4+IFRoaXJkIHBhdGNoIGlzIHRoYXQgdHVybiBv
biBwb3dlciBpZiBpbml0aWFsIHBvd2VyIGRvbWFpbiB3aXRoCj4+PiAiQVdBWV9PTiIgcHJvcGVy
dHkgc3RhdGUgaXMgb2ZmLgo+Pj4KPj4+IE90aGVyIHBhdGNocyBhZGRzIHBvd2VyIGNvbnRyb2xs
ZXIgZHJpdmVyIHN1cHBvcnQgZm9yIEFtbG9naWMgVDcgU29DLgo+Pj4KPj4+IFsuLi5dCj4+Cj4+
IFRoYW5rcywgQXBwbGllZCB0byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9hbWxvZ2ljL2xpbnV4LmdpdCAodjYuNy9hcm02NC1kdCkKPj4KPj4gWzYvNl0g
YXJtNjQ6IGR0czogYW1sb2dpYzogdDc6IGFkZCBwb3dlciBkb21haW4gY29udHJvbGxlciBub2Rl
Cj4+IMKgwqDCoMKgwqDCoCBodHRwczovL2dpdC5rZXJuZWwub3JnL2FtbG9naWMvYy81MzU1Njk5
ZGFiYWMzYzk3NDkyYTMwZTZlMDE4MjBmY2FhZTExMjE4Cj4+Cj4+IFRoZXNlIGNoYW5nZXMgaGFz
IGJlZW4gYXBwbGllZCBvbiB0aGUgaW50ZXJtZWRpYXRlIGdpdCB0cmVlIFsxXS4KPj4KPj4gVGhl
IHY2LjcvYXJtNjQtZHQgYnJhbmNoIHdpbGwgdGhlbiBiZSBzZW50IHZpYSBhIGZvcm1hbCBQdWxs
IFJlcXVlc3QgdG8gdGhlIExpbnV4IFNvQyBtYWludGFpbmVycwo+PiBmb3IgaW5jbHVzaW9uIGlu
IHRoZWlyIGludGVybWVkaWF0ZSBnaXQgYnJhbmNoZXMgaW4gb3JkZXIgdG8gYmUgc2VudCB0byBM
aW51cyBkdXJpbmcKPj4gdGhlIG5leHQgbWVyZ2Ugd2luZG93LCBvciBzb29uZXIgaWYgaXQncyBh
IHNldCBvZiBmaXhlcy4KPj4KPj4gSW4gdGhlIGNhc2VzIG9mIGZpeGVzLCB0aG9zZSB3aWxsIGJl
IG1lcmdlZCBpbiB0aGUgY3VycmVudCByZWxlYXNlIGNhbmRpZGF0ZQo+PiBrZXJuZWwgYW5kIGFz
IHNvb24gdGhleSBhcHBlYXIgb24gdGhlIExpbnV4IG1hc3RlciBicmFuY2ggdGhleSB3aWxsIGJl
Cj4+IGJhY2twb3J0ZWQgdG8gdGhlIHByZXZpb3VzIFN0YWJsZSBhbmQgTG9uZy1TdGFibGUga2Vy
bmVscyBbMl0uCj4+Cj4+IFRoZSBpbnRlcm1lZGlhdGUgZ2l0IGJyYW5jaGVzIGFyZSBtZXJnZWQg
ZGFpbHkgaW4gdGhlIGxpbnV4LW5leHQgdHJlZSBbM10sCj4+IHBlb3BsZSBhcmUgZW5jb3VyYWdl
ZCB0ZXN0aW5nIHRoZXNlIHByZS1yZWxlYXNlIGtlcm5lbHMgYW5kIHJlcG9ydCBpc3N1ZXMgb24g
dGhlCj4+IHJlbGV2YW50IG1haWxpbmctbGlzdHMuCj4+Cj4+IElmIHByb2JsZW1zIGFyZSBkaXNj
b3ZlcmVkIG9uIHRob3NlIGNoYW5nZXMsIHBsZWFzZSBzdWJtaXQgYSBzaWduZWQtb2ZmLWJ5IHJl
dmVydAo+PiBwYXRjaCBmb2xsb3dlZCBieSBhIGNvcnJlY3RpdmUgY2hhbmdlc2V0Lgo+Pgo+PiBb
MV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYW1sb2dp
Yy9saW51eC5naXQKPj4gWzJdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQKPj4gWzNdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQKPj4KPiBJIHJlLXRl
c3RlZCB0aGlzIHRvZGF5IHdpdGggVmltNCBhbmQgd29ya3MgZmluZS4KPiBCeSB3b3JrcyBJIG1l
YW4sIHZpbTQgaXMgYWJsZSB0byBib290IHdpdGhvdXQgcGFuaWNzIGJ1dCBkcm9wcyB0byBlbWVy
Z2VuY3kgc2hlbGwgYXMgZXhwZWN0ZWQuCj4gCj4gSSB3YXMgbm90IGFibGUgdG8gZmluZCBwYXRj
aGVzIDEtMyBhbmQgNSBhdCBhbWxvZ2ljL2Zvci1uZXh0Lgo+IElzIHRoZXJlIGEgcmVhc29uIHdo
eSBhbWxvZ2ljL2Zvci1uZXh0IG9ubHkgaGF2ZSBEVHMgY2hhbmdlcz8KCiBGcm9tIG5vdyBJJ2xs
IG9ubHkgdGFrZSB0aGUgRFQgYW5kIHRoZSBnZW5wZC8gY2hhbmdlcyB3aWxsIGdvIGludG8gdGhl
IG5ldwpzdWJzeXN0ZW0gbWFpbnRhaW5lZCBieSBVbGYuCgpZb3Ugc2hvdWxkIHVzZSB0aGUgZGFp
bHkgbGludXgtbmV4dCB0cmVlIHdoaWNoIHdvdWxkIGNvbnRhaW4gYm90aCB0cmVlcyBtZXJnZWQu
CgpUaGFua3MsCk5laWwKCj4gCj4gVGVzdGVkLWJ5OiBMdWNhcyBUYW51cmUgPHRhbnVyZUBsaW51
eC5jb20+Cj4gCj4gCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
