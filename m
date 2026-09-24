Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF0BC9830E
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2026 15:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Se4jeLphMoS58PlRj6/N0FKWEN865JOJtA+OexSlBJ8=; b=i2GUXl+PpLpEvO
	8/PWI6TLIGC5PKTAieloSeC+GXhkaMiPg0dhcher9OXJ8TKKeAgNjlWiD/or+zVAZeF+rutlZTcjH
	cVGEe+dySlNi/ApsCH6mQihNNAmmLEimaxWJOoEYIFBM4d2KtVwwze6NVzMBgRYP4Neaguv56Gmn3
	AD+V4Ta17+Oi/CFp9EYuRBqAfrPUjTpSm0D8CqpJ+P0fzitYYYbEuHstMNVZ+atvYBQEJZOMym4om
	Xe9pkSvlDxxS5WX2JJJEznO8SGIVdKyv842UsqK1J3645bdl7KrDgoa8AJAjBOo34PflirIZ8t9+I
	n7J50MavSWZYxXzn5JGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lK0-0000000BNf8-1X64;
	Thu, 24 Sep 2026 15:25:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lJz-0000000BNew-1ulA
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Sep 2026 15:25:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DD32E43618;
	Thu, 24 Sep 2026 15:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679651F000FF;
	Thu, 24 Sep 2026 15:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790263514;
	bh=wLRczrhvj5kOUmCIDymBvDfFY4NwRV0X1mOvFQHZwu8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SCBNoqCiXgKq7/cFOTdQe5tZ3eOfMTrEU7WE3JlI+e9f2/VtgJg4pJdit1hEcJM47
	 dB3WOuK15lrJKH3vHOk7zmz3dr9GFTZZgp6uPElJzwrP320pY2YEwB2wRhk0pQ1dIu
	 G6+JKT/U3BKCije9hq3e/fGH5A4ag5U392BIAjlk/BJnDnAihhKmf8qgZNxg+DIKf/
	 RDFk32rzj6NqhMO7xq1+lG/7NwoMpElYtq1onLlujQICzsFW1K6h8BP+OwwxC5Ezua
	 Cpq0fbKbOp5y7Ev/yGhXJwfmxRpaK1JhhWzD2VrQNf5VJCD/w3yPzqkpGg7s6BSwoU
	 nHonLg0K+60kg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: pwm: amlogic: Add core clock for T7
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260924-add-t7-sys-pwm-clk-v1-1-05b91e87f0a9@aliel.fr>
References: <20260924-add-t7-sys-pwm-clk-v1-0-05b91e87f0a9@aliel.fr>
 <20260924-add-t7-sys-pwm-clk-v1-1-05b91e87f0a9@aliel.fr>
Date: Thu, 24 Sep 2026 15:25:13 +0000
Message-Id: <20260924152514.679651F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gZHQtYmluZGluZ3M6
IHB3bTogYW1sb2dpYzogQUJJIGJyZWFrIGZvciBhbWxvZ2ljLHQ3LXB3bQotLQoKY29tbWl0IGVh
MDU1ZjBhYjNlY2Y3NmE0MWIyYTJjZjk5ZWU2MTVlYWMwMGNkYzkKQXV0aG9yOiBSb25hbGQgQ2xh
dmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KCmR0LWJpbmRpbmdzOiBwd206IGFtbG9n
aWM6IEFkZCBjb3JlIGNsb2NrIGZvciBUNwoKVGhpcyBjb21taXQgYWRkcyBhIHRoaXJkIGNvcmUg
Y2xvY2sgZm9yIHRoZSBhbWxvZ2ljLHQ3LXB3bSBjb21wYXRpYmxlCmJpbmRpbmcgYW5kIHJlcXVp
cmVzIGNsb2NrLW5hbWVzIGZvciB0aGlzIFNvQy4gT3RoZXIgY29tcGF0aWJsZXMgYXJlIGxlZnQK
dW5jaGFuZ2VkLCBhbmQgYW4gZXhhbXBsZSBpcyBhZGRlZCBmb3IgVDcgdXNhZ2UuCgo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL3B3bS1hbWxvZ2lj
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL3B3bS1hbWxvZ2lj
LnlhbWwKPiBpbmRleCBjMzM3ZDg1ZGE0MGYxLi45MjEyYTQwZDlmZTQ4IDEwMDY0NAo+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vcHdtLWFtbG9naWMueWFtbAo+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vcHdtLWFtbG9naWMu
eWFtbAoKWyAuLi4gXQoKPiBAQCAtMTM1LDE3ICsxMzUsMzggQEAgYWxsT2Y6Cj4gICAgICAgIHBy
b3BlcnRpZXM6Cj4gICAgICAgICAgY29tcGF0aWJsZToKPiAgICAgICAgICAgIGNvbnRhaW5zOgo+
IC0gICAgICAgICAgICBlbnVtOgo+IC0gICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1zNC1w
d20KPiArICAgICAgICAgICAgY29uc3Q6IGFtbG9naWMsdDctcHdtCj4gICAgICB0aGVuOgo+ICAg
ICAgICBwcm9wZXJ0aWVzOgo+ICAgICAgICAgIGNsb2NrczoKPiAgICAgICAgICAgIGl0ZW1zOgo+
ICAgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBpbnB1dCBjbG9jayBvZiBQV00gY2hhbm5lbCBB
Cj4gICAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IGlucHV0IGNsb2NrIG9mIFBXTSBjaGFubmVs
IEIKPiAtICAgICAgICBjbG9jay1uYW1lczogZmFsc2UKPiArICAgICAgICAgICAgLSBkZXNjcmlw
dGlvbjogZ2F0ZSBjbG9jayBmb3IgdGhlIFBXTSBjb250cm9sbGVyCj4gKyAgICAgICAgY2xvY2st
bmFtZXM6Cj4gKyAgICAgICAgICBpdGVtczoKPiArICAgICAgICAgICAgLSBjb25zdDogY2xrX2EK
PiArICAgICAgICAgICAgLSBjb25zdDogY2xrX2IKPiArICAgICAgICAgICAgLSBjb25zdDogY29y
ZQo+ICAgICAgICByZXF1aXJlZDoKPiAgICAgICAgICAtIGNsb2Nrcwo+ICsgICAgICAgIC0gY2xv
Y2stbmFtZXMKCltTZXZlcml0eTogTWVkaXVtXQpEb2VzIHRoaXMgaW50cm9kdWNlIGEgc2NoZW1h
IHZhbGlkYXRpb24gcmVncmVzc2lvbiBmb3Igb2xkZXIgZGV2aWNlIHRyZWVzPwoKQnkgZGVmaW5p
bmcgZXhhY3RseSB0aHJlZSBpdGVtcyBpbiB0aGUgY2xvY2tzIGxpc3QgYW5kIHN0cmljdGx5IHJl
cXVpcmluZwp0aGUgY2xvY2stbmFtZXMgcHJvcGVydHksIG9sZGVyIGRldmljZSB0cmVlcyB0aGF0
IG9ubHkgcHJvdmlkZSB0d28gY2xvY2tzCmFuZCBvbWl0IGNsb2NrLW5hbWVzIHdpbGwgZmFpbCB2
YWxpZGF0aW9uLiBEZXZpY2UgdHJlZSBzY2hlbWFzIHR5cGljYWxseQptdXN0IG1haW50YWluIGJh
Y2t3YXJkIGNvbXBhdGliaWxpdHkgd2l0aCBvbGRlciBvciBvdXQtb2YtdHJlZSBEVEJzLgoKU2hv
dWxkIHRoZSBzY2hlbWEgc3BlY2lmeSBhIG1pbmltdW0gaXRlbSBjb3VudCBvZiAyIGZvciBjbG9j
a3MgYW5kIG9ubHkKY29uZGl0aW9uYWxseSByZXF1aXJlIGNsb2NrLW5hbWVzIGJhc2VkIG9uIHRo
ZSBudW1iZXIgb2YgY2xvY2tzIHByb3ZpZGVkCnRvIGF2b2lkIGFuIEFCSSBicmVhaz8KCi0tIApT
YXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5
MjQtYWRkLXQ3LXN5cy1wd20tY2xrLXYxLTAtMDViOTFlODdmMGE5QGFsaWVsLmZyP3BhcnQ9MQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
