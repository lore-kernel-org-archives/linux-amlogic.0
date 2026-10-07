Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13415CA6002
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2026 08:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9mYyRiO0vIofGpptXdVTdapGnxgHwjq2/aOXQySl/gg=; b=uGD3edFwA1/uYx
	RDENQaiRN6I+6EdfowGTjk16B+Y+0BYkltJBMv7nA42KZk1xi3S+fzFAglvbZ2uMOk+HbwllPcjuA
	0oVfxeN9UghHP/inycTRGsdMksGMT6lAaePvj9PJNW5dY3yRE9Kf0KE4/OGI+aaSvP6weEvsfKsjx
	rYhNeghBMLY6WrMp2TWZ6XrxJr9gDnLSYMOIOAsujIHr8RjmOC04m7UcS1gJkMtbacC5byWGuaP+P
	QoZepf6ZbKcpMNhvX1LUmTh0MZ0yuz4B6VpV/FYo0SSelkUEf1bUrdUAWRVyzER96X5o9WY7kBXIR
	I0YFWIAq+ZIve6W7p1Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEN5i-00000001xeN-29Zn;
	Wed, 07 Oct 2026 08:33:34 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEN5f-00000001xde-2I2Q
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Oct 2026 08:33:33 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso1101227f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2026 01:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791362009; x=1791966809; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XxcGgnejISp1+VB6bpLIgoBBJ18yCkjKzQQ5g+qkFis=;
        b=J5JRsm84TNPNCps8boQurq5o/UnEDls4u5XxEyeUbH7eC4EIpfmnic98/wvct3PMLc
         L99RH9JVofYX3M+QxmPmG+aJp7i1pFv/RGnyiESGi+KEImSTpms4oguZwOS+Pv2sv3e4
         //3k4UaFQhilXVXNQYVb382R80s08Gi4/gRZJW+Cd6S498oUE0F3wOtKvvYUpES1CZr2
         yYYIDX7Yj5jZudSO6d5ah5/RFZ+03YmGhI/LELmuWtbM0mRPGse0/uI8UYAUthHxpU5W
         XnPHq17nKAdDe+XLazQJz06VCetHAjuDWWWYzPrUkjrjYMWA6KvzIOIiQ8fSg8CTSZBM
         aG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362009; x=1791966809;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxcGgnejISp1+VB6bpLIgoBBJ18yCkjKzQQ5g+qkFis=;
        b=Ps3GKCniIbbwqPOdjSLhM5gVg+ckDwb7g347uS6A7QhKE0lu5ZYrJNvNLUWxwk5UqT
         iHVOGaq6jUvE3tN4ePtKtuBVqyDA8WDN/w989Z+ohoPi+YgfajnKB0H7exuCqi26ORdF
         fvfDcnjiOahsS3aTGf80sp0kQIwqcSH6B8T/VwOeHBksLLNeFQ7mahZmTfbuqPgYwr3x
         7OqshiO91oiJd09LSJot3VZlUqO74m9buh/Xgo707GVs2BjdtqwouzAk9EJRDabqBrSW
         CEbQsrDD2CJgnHz58sGi9v0gVs6nEDev3dP9ZaX7CvvmfNSq0dQHL7CKAaYW4cR8Hrx/
         NOOA==
X-Forwarded-Encrypted: i=1; AKwUvBzMSZPmAJch+zz1h/wJDTSTLS3/+U9oac3n9qXeHJ4xEZfN0w+2+DKnq6LVPdBpyVJM1z8ypeupygtmP9mq@lists.infradead.org
X-Gm-Message-State: AFq9FYICqK3C4VTChJ9PKyhh2suSIbVAKwKIIqBIOJW+fSS4O9/Dx6O7
	sWYylhrQY/ZbrAxDcUZgCuMK61dlvjKMU1eBQYDVvRlEERjEeY6jkr47Lpa0NZZJMAw=
X-Gm-Gg: AYBFou05+364dul/FVmFruV9p3NkoBSF2D6HuTGeLmDOmTJKMupb0ABPrtC9wAVYJQR
	cBvkU02qw8FxKzLlQzowpXdRUdrM/TJvgIUkwXke7AI/RKMLpAqN6YyyRABfxCKxpl5z4fNIDrZ
	8cOAv0scDSwvoBWhVXPk6BbFupCoWpStRc0CmjSFsVwGwtYtftumcBZxmgPSPNjbO6+5p1XrXDw
	lkjXwLD95JtgS1uWZke9UAIcnH7KSDXJ2onp60ToCe7fqrH2qig0WttxX8g+x4RkhM5rxgTls8n
	ZdHQuOXgpSwqKDy37adS6ZmoG/HawTGG6FD1lIyW+loEMkp2MmQU48C0qGcGmz2Gvy0Oz8xhIWA
	nzcEsJvI1gcELLIUInKZ5r9cA6TnRvzg/cO8XNQNNrTEdeq7hfOHHVfCkuIt+NgJQpaQ9wHbBBE
	Vuc4h3ZCEvllQ1i5A+vA7zdrAQzSrQc9uQb7Kb4kVzt7+pZfHwf0E3U5VbIbP2Pyaeq+tq2jke3
	bTVpOjKKcDxCKU=
X-Received: by 2002:a05:6000:3cd:b0:48c:69b3:6114 with SMTP id ffacd0b85a97d-48c69b362fdmr9482875f8f.3.1791362009297;
        Wed, 07 Oct 2026 01:33:29 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4290158f8f.52.2026.10.07.01.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:33:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-reviews@lists.linux.dev, Valerio Setti <vsetti@baylibre.com>
Cc: robh@kernel.org, neil.armstrong@linaro.org,
 linux-amlogic@lists.infradead.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/7] ASoC: meson: add AUDIN driver
In-Reply-To: <20261001162313.4333D1F000FF@smtp.kernel.org>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-4-2476646118b5@baylibre.com>
 <20261001162313.4333D1F000FF@smtp.kernel.org>
Date: Wed, 07 Oct 2026 10:33:27 +0200
Message-ID: <1jbj95zz8o.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_013331_605813_83EAF9A3 
X-CRM114-Status: GOOD (  14.93  )
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

T24gVGh1IDAxIE9jdCAyMDI2IGF0IDE2OjIzLCBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIHdyb3Rl
OgoKCj4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvbWVzb24vYXVkaW4uYyBiL3NvdW5kL3NvYy9t
ZXNvbi9hdWRpbi5jCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAw
MDAuLjgwOGU3ZDRmZDMxYTIKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9zb3VuZC9zb2MvbWVz
b24vYXVkaW4uYwo+IFsgLi4uIF0KPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnbWFwX2NvbmZp
ZyBhdWRpbl9yZWdtYXBfY2ZnID0gewo+PiArCS5yZWdfYml0cwk9IDMyLAo+PiArCS52YWxfYml0
cwk9IDMyLAo+PiArCS5yZWdfc3RyaWRlCT0gNCwKPj4gKwkubWF4X3JlZ2lzdGVyCT0gMHgxNDgs
Cj4+ICt9Owo+Cj4gW1NldmVyaXR5OiBNZWRpdW1dCj4gV2lsbCBoYXJkd2FyZSBzdGF0ZSBsaWtl
IHRoZSBjaGFubmVsIG1hc2sgYW5kIGVuZGlhbm5lc3MgYmUgbG9zdCBhY3Jvc3MKPiBzeXN0ZW0g
c3VzcGVuZCBhbmQgcmVzdW1lIGN5Y2xlcz8KCkl0IGlzIGEgZ29vZCBxdWVzdGlvbiBidXQgSSdk
IGNvbnNpZGVyIHRoaXMgYSBwcmUtZXhpc3RpbmcgaXNzdWUsIGlmIGl0CmlzIG9uZS4KCkFtbG9n
aWMgYXVkaW8gZHJpdmVycyBoYXZlIHNlZW4gdmVyeSBsaXR0bGUgdGVzdGluZywgaWYgYW55LCB3
aGVuIGl0CmNvbWVzIHRvIHN1c3BlbmQvcmVzdW1lLCBiZWNhdXNlIHRoZSBzdXNwZW5kIHN1cHBv
cnQgZnJvbSB0aGUgcGxhdGZvcm1zCnRoZW0gc2VsZiB3YXMgdmVyeSBsaW1pdGVkIHRvby4gSSBo
YXZlIG5vIGlkZWEgaWYgdGhlIHNpdHVhdGlvbiBoYXMKaW1wcm92ZWQgbGF0ZWx5IGJ1dCB0aGUg
c3ViamVjdCBpcyBkZWZpbml0ZWx5IG5vdCBsaW1pdGVkIHRvIHRoaXMgZHJpdmVyLgoKSU9XLCB0
aGUgaXNzdWUgbWlnaHQgZXhpc3QgKG9yIG5vdCkgYnV0IEkgZG8gbm90IHRoaW5rIGl0IHNob3Vs
ZCBiZSBhCmJsb2NraW5nIHBvaW50IEFUTS4KCj4KPiBBTFNBIGNhbGxzIHRoZSBkcml2ZXIncyBw
cmVwYXJlKCkgY2FsbGJhY2sgdG8gcmVjb3ZlciBhIHN1c3BlbmRlZCBzdHJlYW0sCj4gYnV0IG5v
dCBod19wYXJhbXMoKS4gQmVjYXVzZSB0aGlzIHJlZ21hcCBsYWNrcyBhIGNhY2hlIGNvbmZpZ3Vy
YXRpb24sIGl0Cj4gY2Fubm90IGF1dG9tYXRpY2FsbHkgcmVzdG9yZSB0aGUgcmVnaXN0ZXIgc3Rh
dGUgY29uZmlndXJlZCBkdXJpbmcgaHdfcGFyYW1zKCkKPiB3aGVuIHRoZSBzeXN0ZW0gcmVzdW1l
cy4KPgo+IC0tIAo+IFNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9w
YXRjaHNldC8yMDI2MTAwMS1hdWRpbi12NC0wLTI0NzY2NDYxMThiNUBiYXlsaWJyZS5jb20/cGFy
dD00Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cj4gbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCgotLSAKSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
